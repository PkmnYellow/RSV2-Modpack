/**
 * Deband shader by haasn
 * https://github.com/mpv-player/mpv/blob/master/video/out/opengl/video_shaders.c
 *
 * This file is part of mpv.
 *
 * mpv is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * mpv is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with mpv.  If not, see <http://www.gnu.org/licenses/>.
 *
 * You can alternatively redistribute this file and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * Modified and optimized for ReShade by JPulowski
 * http://reshade.me/forum/shader-presentation/768-deband
 *
 * Do not distribute without giving credit to the original author(s).
 *
 * 1.0  - Initial release
 * 1.1  - Replaced the algorithm with the one from MPV
 * 1.1a - Minor optimizations
 *        Removed unnecessary lines and replaced them with ReShadeFX intrinsic counterparts
 */

#include EFFECT_CONFIG(JPulowski)

#if USE_DEBAND

#pragma message "Deband by haasn (ported by JPulowski)\n"

namespace JPulowski {

uniform int drandom < source = "random"; min = 0; max = 5000; >;

float permute(float x) { return ((34.0 * x + 1.0) * x) % 289.0; }
float rand(float x)    { return frac(x * 0.024390243); }

// Helper: Compute a stochastic approximation of the avg color around a pixel
float3 average(sampler2D tex, float2 pos, float range, inout float h) {
    // Compute a random rangle and distance
    float dist = rand(h) * range;     h = permute(h);
    float dir  = rand(h) * 6.2831853; h = permute(h);

    float2 pt = dist * ReShade::PixelSize;
    float2 o = float2(cos(dir), sin(dir));

    // Sample at quarter-turn intervals around the source pixel
    float3 ref[4];
    ref[0] = tex2D(tex, pos + pt * float2( o.x,  o.y)).rgb;
    ref[1] = tex2D(tex, pos + pt * float2(-o.y,  o.x)).rgb;
    ref[2] = tex2D(tex, pos + pt * float2(-o.x, -o.y)).rgb;
    ref[3] = tex2D(tex, pos + pt * float2( o.y, -o.x)).rgb;

    // Return the (normalized) average
    return (ref[0] + ref[1] + ref[2] + ref[3]) * 0.25;
}

float3 PS_Deband(float4 vpos : SV_POSITION, float2 texcoord : TEXCOORD0) : SV_TARGET {
    float h;
    // Initialize the PRNG by hashing the position + a random uniform
    float3 m = float3(texcoord, drandom * 0.0002) + 1.0;
    h = permute(permute(permute(m.x) + m.y) + m.z);

    // Sample the source pixel
    float3 col = tex2D(ReShade::BackBuffer, texcoord).rgb;
	float3 avg; float3 diff;
	
	#if (Iterations == 1)
		[unroll]
	#endif
    for (int i = 1; i <= Iterations; i++) {
        // Sample the average pixel and use it instead of the original if the difference is below the given threshold
        avg = average(ReShade::BackBuffer, texcoord, i * Range, h);
        diff = abs(col - avg);
        col = lerp(avg, col, diff > Threshold * 0.00006103515625 * i);
    }

    if (Grain > 0.0) {
		// Add some random noise to smooth out residual differences
		float3 noise;
		noise.x = rand(h); h = permute(h);
		noise.y = rand(h); h = permute(h);
		noise.z = rand(h); h = permute(h);
		col += (Grain * 0.000122070313) * (noise - 0.5);
	}

    return col;
}

technique Deband_Tech <bool enabled = RESHADE_START_ENABLED; int toggle = Deband_ToggleKey; >
{
	pass DebandPass
	{
		VertexShader = ReShade::VS_PostProcess;
		PixelShader = PS_Deband;
	}
}

}

#endif

#include EFFECT_CONFIG_UNDEF(JPulowski)
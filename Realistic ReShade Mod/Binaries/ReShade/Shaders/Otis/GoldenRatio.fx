#include EFFECT_CONFIG(Otis)
#include "Common.fx"

#if USE_GOLDENRATIO

#pragma message "GoldenRatio by Otis\n"

namespace Otis
{

texture2D	GOR_texSpirals < string source= "Reshade\\Shaders\\Otis\\Textures\\GoldenSpirals.png"; > { Width = 1748; Height = 1080; MipLevels = 1; Format = RGBA8; };
sampler2D	GOR_samplerSpirals
{
	Texture = GOR_texSpirals;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = LINEAR;
	AddressU = Clamp;
	AddressV = Clamp;
};

void PS_Otis_GOR_RenderSpirals(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 outFragment : SV_Target0)
{
	float4 colFragment = tex2D(ReShade::BackBuffer, texcoord);
	float phiValue = ((1.0 + sqrt(5.0))/2.0);
	float aspectRatio = (float(BUFFER_WIDTH)/float(BUFFER_HEIGHT));
	float idealWidth = float(BUFFER_HEIGHT) * phiValue;
	float idealHeight = float(BUFFER_WIDTH) / phiValue;
	float4 sourceCoordFactor = float4(1.0, 1.0, 1.0, 1.0);

#if GOR_ResizeMode==1	
	if(aspectRatio < phiValue)
	{
		// display spirals at full width, but resize across height
		sourceCoordFactor = float4(1.0, float(BUFFER_HEIGHT)/idealHeight, 1.0, idealHeight/float(BUFFER_HEIGHT));
	}
	else
	{
		// display spirals at full height, but resize across width
		sourceCoordFactor = float4(float(BUFFER_WIDTH)/idealWidth, 1.0, idealWidth/float(BUFFER_WIDTH), 1.0);
	}
#endif
	float4 spiralFragment = tex2D(GOR_samplerSpirals, float2((texcoord.x * sourceCoordFactor.x) - ((1.0-sourceCoordFactor.z)/2.0),
														    (texcoord.y * sourceCoordFactor.y) - ((1.0-sourceCoordFactor.w)/2.0)));
	outFragment = saturate(colFragment + (spiralFragment * GOR_Opacity));
}

technique Otis_GOR_Tech <bool enabled = false; int toggle = GOR_ToggleKey; >
{
	pass Otis_GOR_Desaturate
	{
		VertexShader = ReShade::VS_PostProcess;
		PixelShader = PS_Otis_GOR_RenderSpirals;
	}
}

}

#endif

#include EFFECT_CONFIG_UNDEF(Otis)

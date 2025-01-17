package shaders.codes;

import flixel.system.FlxAssets.FlxShader;

class Bloom extends FlxShader
{
	public var tween:Bool = false;
	@:glFragmentSource("
    #pragma header

    const float blurSize = 1.0/512.0;
    
    uniform float intensity;
    void main()
    {
        vec4 sum = vec4(0);
        vec2 texcoord = openfl_TextureCoordv.xy;
        int j;
        int i;

        //thank you! http://www.gamerendering.com/2008/10/11/gaussian-blur-filter-shader/ for the 
        //blur tutorial
        // blur in y (vertical)
        // take nine samples, with the distance blurSize between them
        sum += flixel_texture2D(bitmap, vec2(texcoord.x - 4.0*blurSize, texcoord.y)) * 0.05;
        sum += flixel_texture2D(bitmap, vec2(texcoord.x - 3.0*blurSize, texcoord.y)) * 0.09;
        sum += flixel_texture2D(bitmap, vec2(texcoord.x - 2.0*blurSize, texcoord.y)) * 0.12;
        sum += flixel_texture2D(bitmap, vec2(texcoord.x - blurSize, texcoord.y)) * 0.15;
        sum += flixel_texture2D(bitmap, vec2(texcoord.x, texcoord.y)) * 0.16;
        sum += flixel_texture2D(bitmap, vec2(texcoord.x + blurSize, texcoord.y)) * 0.15;
        sum += flixel_texture2D(bitmap, vec2(texcoord.x + 2.0*blurSize, texcoord.y)) * 0.12;
        sum += flixel_texture2D(bitmap, vec2(texcoord.x + 3.0*blurSize, texcoord.y)) * 0.09;
        sum += flixel_texture2D(bitmap, vec2(texcoord.x + 4.0*blurSize, texcoord.y)) * 0.05;
            
            // blur in y (vertical)
        // take nine samples, with the distance blurSize between them
        sum += flixel_texture2D(bitmap, vec2(texcoord.x, texcoord.y - 4.0*blurSize)) * 0.05;
        sum += flixel_texture2D(bitmap, vec2(texcoord.x, texcoord.y - 3.0*blurSize)) * 0.09;
        sum += flixel_texture2D(bitmap, vec2(texcoord.x, texcoord.y - 2.0*blurSize)) * 0.12;
        sum += flixel_texture2D(bitmap, vec2(texcoord.x, texcoord.y - blurSize)) * 0.15;
        sum += flixel_texture2D(bitmap, vec2(texcoord.x, texcoord.y)) * 0.16;
        sum += flixel_texture2D(bitmap, vec2(texcoord.x, texcoord.y + blurSize)) * 0.15;
        sum += flixel_texture2D(bitmap, vec2(texcoord.x, texcoord.y + 2.0*blurSize)) * 0.12;
        sum += flixel_texture2D(bitmap, vec2(texcoord.x, texcoord.y + 3.0*blurSize)) * 0.09;
        sum += flixel_texture2D(bitmap, vec2(texcoord.x, texcoord.y + 4.0*blurSize)) * 0.05;

        gl_FragColor = sum * intensity + flixel_texture2D(bitmap, texcoord);
    }")
	public function new()
	{
		super();
	}
}
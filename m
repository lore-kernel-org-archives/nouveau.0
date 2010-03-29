From: SpliFF <spliff-nc9XehmSRdrhF+sknpXCvw@public.gmane.org>
Subject: Re: Status of s3tc patent in respect to open-source
	drivers and workarounds
Date: Mon, 29 Mar 2010 19:20:20 +1100
Message-ID: <4BB062C4.1030006@warriorhut.org>
References: <4BAF41C0.5010201@warriorhut.org>		<e7bd23c31003281707v4d8107a8ka4330ce69ba5b322@mail.gmail.com>		<4BB004EB.5080109@warriorhut.org>	<e7bd23c31003282134o32a5ec11ua6c7814fd5f3a7f5@mail.gmail.com>
	<4BB04245.8020202@warriorhut.org>
	<4BB04371.5020301@freedesktop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4BB04371.5020301-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ian Romanick <idr-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, radeonhd-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org, mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 03/29/10 17:06, Ian Romanick wrote:
> SpliFF wrote:
> > So to clarify, you're saying a partial implementation (decoder only)
> > isn't an option at all? If you expose an extension it must be complete?
>
> See the documentation for glGetCompressedTexImage.

That does not appear to imply a run-time encoder. It seems to imply the
data is already compressed - which could (and really should) be done
prior to distribution (via the nvidia tools for example). The
documentation does quite clearly state that the application should
verify the texture really was compressed so you're only going to run
into issues when the programmer made assumptions about the supported
hardware. Not saying that's impossible, just that that's the
programmers' responsibility, not the drivers.

Runtime compression is actually performed by glTexImage2D with its
internalFormat set to a supported *_S3TC_* value, however the 2.1 spec says:

"If no corresponding internal format is available, or the GL can not
compress that image for any reason, the internal format is instead
replaced with a corresponding base internal format."

For S3TC textures that is:

GL_COMPRESSED_RGB_S3TC_DXT1_EXT  -> RGB
GL_COMPRESSED_RGBA_S3TC_DXT1_EXT ->  RGBA
GL_COMPRESSED_RGBA_S3TC_DXT3_EXT ->  RGBA
GL_COMPRESSED_RGBA_S3TC_DXT5_EXT ->  RGBA

So the spec specifically says you don't need runtime compression to be
compliant, you can fall back to uncompressed and hide the distinction
from the application (or expose it via glGetTexLevelParameteriv). Also,
for the purpose of mesa3d software rendering, why would you really want
to compress an image intended for system RAM? Chances are you'd lose
significantly on rendering performance. The way I see it the worst case
scenario is you use more memory than the developer intended but at least
you're displaying the textures. I know from experience that any normal
game rendered entirely without textures is basically unplayable.

So really, what I'd like clarification on is whether anyone knows of
potential non-infringing workarounds for the independent claims of the
s3tc decoding process only (claims 5, 16, 21 and 22 in the patent). The
rest (encoding) isn't as important as there are already free licensed
tools available for that part (not to mention existing compressed assets
to be rendered).

Finally, if anyone on the nouveau/radeonhd lists would prefer I stop
posting there please email me privately and I'll comply. If hardware
passthrough of s3tc textures is in fact supported by those drivers (and
the user has compatible hardware) then s3tc decoding is less relevant
for that purpose and the discussion is really only relevant to mesa3d
software rendering. I'm new to these lists and I didn't come here just
to make people upset. I don't know how much crossover exists between the
groups and who is getting three copies of these posts.

SpliFF

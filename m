From: Luca Barbieri <luca.barbieri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Mesa3d-dev] Status of s3tc patent in respect to open-source
	drivers and workarounds
Date: Sun, 28 Mar 2010 18:44:48 +0200
Message-ID: <ff13bc9a1003280944u5178a756p6073d8dac557b69e@mail.gmail.com>
References: <4BAF41C0.5010201@warriorhut.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <radeonhd+bounces-9524-gcfxdr-radeonhd=m.gmane.org-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Post: <mailto:radeonhd-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:radeonhd+help-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Subscribe: <mailto:radeonhd+subscribe-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <mailto:radeonhd+unsubscribe-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Owner: <mailto:radeonhd+owner-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Archive: <http://lists.opensuse.org/radeonhd/>
In-Reply-To: <4BAF41C0.5010201-nc9XehmSRdrhF+sknpXCvw@public.gmane.org>
To: SpliFF <spliff-nc9XehmSRdrhF+sknpXCvw@public.gmane.org>
Cc: mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, information-juUERV/Fi2c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, radeonhd-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org
List-Id: nouveau.vger.kernel.org

If the application provides s3tc-encoded data through
glCompressedTexImage (usually loaded from a pre-compressed texture
stored on disk), Mesa will pass it unaltered to the graphics card (as
long as the driver/card supports DXT* format ids) and will not need to
use any encoding or decoding algorithms.

The problem is that if the application supplies uncompressed data,
Mesa would need to run an encoding algorithm to be able to use
compressed textures.

Conversely, if software rendering is necessary, and the application
provides compressed textures, Mesa will need to run a decoding
algorithm to be able to sample from the texture.

So the workaround (and what commercial games usually do) is to ship
pre-compressed textures along with the game, as well as uncompressed
textures in case the card/rendered do not support texture compression.
An end-user side solution is to download, compile and install
libtxc_dxtn.so, which Mesa will use if present to decode and encode
compressed textures.

Furthermore, a GPU can be used to do decoding using its native
sampling support, and some may also support encoding.
-- 
To unsubscribe, e-mail: radeonhd+unsubscribe-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org
For additional commands, e-mail: radeonhd+help-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org

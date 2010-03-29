From: Luca Barbieri <luca.barbieri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Mesa3d-dev] [Nouveau] Re: Status of s3tc patent in
	respect to open-source drivers and workarounds
Date: Mon, 29 Mar 2010 09:10:13 +0200
Message-ID: <ff13bc9a1003290010w4336cf16tfabd511a1425ceb1@mail.gmail.com>
References: <4BAF41C0.5010201@warriorhut.org>
	 <e7bd23c31003281707v4d8107a8ka4330ce69ba5b322@mail.gmail.com>
	 <4BB004EB.5080109@warriorhut.org>
	 <6a89f9d51003282153l2c20b049s38d94c9691531efa@mail.gmail.com>
	 <4BB04324.2070206@freedesktop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <radeonhd+bounces-9534-gcfxdr-radeonhd=m.gmane.org-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Post: <mailto:radeonhd-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:radeonhd+help-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Subscribe: <mailto:radeonhd+subscribe-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <mailto:radeonhd+unsubscribe-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Owner: <mailto:radeonhd+owner-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Archive: <http://lists.opensuse.org/radeonhd/>
In-Reply-To: <4BB04324.2070206-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>
To: Ian Romanick <idr-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>
Cc: Stephane Marchesin <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, radeonhd-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org, mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

Interestingly, the post-trial judge opinion at
http://wi.findacase.com/research/wfrmDocViewer.aspx/xq/fac.%5CFDCT%5CWWI%5C=
2008%5C20080801_0000734.WWI.htm/qx
contains the following text:

<<
Plaintiff=92s expert, Dr. Stevenson, testified that the =91327 patent is
directed to =93a special
purpose hardware component designed and optimized specifically for
high speed graphics
processing. "
The specification makes it plain that the invention does not relate to
software for graphics. As the inventors noted, such programs =93are well
known in the art."
[...]
Claim 17 does not say in so many words that the method it discloses is
a rasterization
circuit operating on a floating point format, but that is what it describes=
.
Reading the disputed claims as disclosing hardware is not reading a
preferred embodiment in the claims; it is simply
reading the claims as the person of ordinary skill would read a patent
directed to special purpose hardware.
>>

This seems to indicate that it would be safe to implement floating
point textures/framebuffers in Mesa, as both SGI and ATI and the court
seemed to agree that the patent applies specifically to hardware.
-- 
To unsubscribe, e-mail: radeonhd+unsubscribe-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org
For additional commands, e-mail: radeonhd+help-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org

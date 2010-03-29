From: SpliFF <spliff-nc9XehmSRdrhF+sknpXCvw@public.gmane.org>
Subject: Re: [radeonhd] Re: [Mesa3d-dev] Status of s3tc patent in
 respect to open-source drivers and workarounds
Date: Mon, 29 Mar 2010 17:01:41 +1100
Message-ID: <4BB04245.8020202@warriorhut.org>
References: <4BAF41C0.5010201@warriorhut.org>	
	<e7bd23c31003281707v4d8107a8ka4330ce69ba5b322@mail.gmail.com>	
	<4BB004EB.5080109@warriorhut.org>
	<e7bd23c31003282134o32a5ec11ua6c7814fd5f3a7f5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <e7bd23c31003282134o32a5ec11ua6c7814fd5f3a7f5-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Corbin Simpson <mostawesomedude-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, radeonhd-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org, mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 03/29/10 15:34, Corbin Simpson wrote:
>
> There is already a non-infringing decoder inside Mesa, wired up
> correctly, that kicks in when the HW supports it, but there's no
> extension that exposes only decoding and loading functionality. As Ian
> said, you need an encoder as well, and no HW has it, so you'd have to
> write some questionable code.
>   

So to clarify, you're saying a partial implementation (decoder only)
isn't an option at all? If you expose an extension it must be complete?
Can't you just do a NOOP on encoding or handle it uncompressed? I don't
see why the encoder is so important since it seems to me that
uncompressed data would cause no issues for software rendering and
compressed data should cause no issues for hardware rendering (as stated
earlier, on most modern hardware you can pass it through to VRAM). The
main problem seems to be the lack of a decoder as it makes assets
completely unusable on certain platforms whereas lack of an encoder
typically only impairs efficiency except in fringe cases (games that
compress textures "on-the-fly").

> I'm kind of confused. Are you just trying to see if any of us can be
> convinced to write this code for you?
>   

Yes. Though not for me as I don't play the games in question.

However that's an oversimplification. What I'm really asking is when it
was concluded no workaround is possible, to what extent was it discussed
or was it agreed that nobody should look at the patent at all (willful
infringement defense)? Are the legal opinions you are referring to made
public? Is the issue a lack or resources, lack of interest, lack of
alternatives, lack of understanding or just a general fear of
unspecified litigation or vague threats.

It was also an attempt to see where the EFF sits on this issue and
whether that would consider investigating some of the broader claims in
the patent as part of their patent busting efforts. After all, if there
really is NO possible workaround it kind of implies, to a layman at
least, that the patents claims may be overly broad.

I am simply following a sensible process of elimination, which is:

a.) Determine what can't be done.
b.) Determine what can be done.
c.) Substitute b for a.

If you won't touch it, then you won't. If you don't want to talk about
it (again) I completely understand. I can't force you and I won't nag
you. But there may be others out there, perhaps sitting on the
sidelines, who might have something new to offer. At the least consider
this a case of simple curiousity as the FAQ is somewhat vague on the
matter and the specific claim(s) at issue unclear (at least to me). Even
with access to the archives of this list I don't have the benefit of
knowing the full extent to which this issue has been explored behind the
scenes.

I raised the points I raised to assist in a way that seems positive.
That is to cut through several pages of patent legalese to the specific
claim elements blocking a new type of decoder and then try build a
preliminary technical assessment that could guide programmers around the
hurdles or be reviewed by a patent attorney without completely wasting
their time.

SpliFF

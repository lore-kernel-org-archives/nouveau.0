From: Corbin Simpson <mostawesomedude-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [radeonhd] Re: [Mesa3d-dev] Status of s3tc patent in
	respect to open-source drivers and workarounds
Date: Sun, 28 Mar 2010 21:34:29 -0700
Message-ID: <e7bd23c31003282134o32a5ec11ua6c7814fd5f3a7f5@mail.gmail.com>
References: <4BAF41C0.5010201@warriorhut.org>
	<e7bd23c31003281707v4d8107a8ka4330ce69ba5b322@mail.gmail.com>
	<4BB004EB.5080109@warriorhut.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4BB004EB.5080109-nc9XehmSRdrhF+sknpXCvw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: SpliFF <spliff-nc9XehmSRdrhF+sknpXCvw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, radeonhd-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org, mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Mar 28, 2010 at 6:39 PM, SpliFF <spliff-nc9XehmSRdrhF+sknpXCvw@public.gmane.org> wrote:
> Solves nothing other than push the legal burden onto someone else
> (distributions) who further push the burden to the end-user. All of
> which makes it harder to use. As far as I can tell the official site of
> the "external project" claims the project is unmaintained and at any
> rate it's rather unpopular with certain distributions for reasons that
> should be obvious.
>
> I'm certainly not sugesting that knowingly infringing material be added
> to mesa3d. What I'm suggesting is that some resources be made available
> to write a new *non-infringing* decompressor and that it seems likely
> the community may have overestimated the difficulty of the task. I often
> wonder if the OSS community isn't becoming a victim of its own FUD. If
> we need lawyers before writing code then we can't write ANY code and we
> might as well all do something else.

There is already a non-infringing decoder inside Mesa, wired up
correctly, that kicks in when the HW supports it, but there's no
extension that exposes only decoding and loading functionality. As Ian
said, you need an encoder as well, and no HW has it, so you'd have to
write some questionable code.

> I want to reiterate that it is my belief (as in non-legal opinion) that
> the s3tc patent does not cover the s3tc format itself, or even specific
> algorithms. What it covers appear to be specific methods that can be
> used to encode it and some steps that can be used to decode it. The
> issue is whether those claimed steps are the ONLY way of achieving an
> acceptable result and I honestly don't think they are. You are free to
> form your own opinion on that point. Then again if the community plays
> ostrich and assumes the problem is now solved - and worse concludes that
> any discussion of it is heresy - then how can a new invention be
> developed (at least collaboratively)? Unfortunately I lack the indepth
> knowledge of mesa3d internals and s3tc processing requirements required
> to invent such a thing myself.

Cool, I'm glad that you share the opinion of other people on the
Internets on this issue. Feel free to help keep libdxtn from
bitrotting. However, many of the Mesa devs are paid, and their bosses
have indicated that there are issues here, so don't hold your breath
for any of us to do anything beyond maintain the interface to libdxtn.

I'm kind of confused. Are you just trying to see if any of us can be
convinced to write this code for you?

> Unfortunately Spring is an engine, not a game. The issue is that people
> writing games which use the engine typically use DDS textures due to
> various community members bandying the format about like it's the second
> coming. At any rate other than not supporting DDS at all (which would be
> an extremely unpopular and unworkable decision) there isn't much I can
> do to guarantee Spring games don't depend on proprietary drivers until a
> non-infringing s3tc decoder exists.
>
> SpliFF
>

Well, I can't help you there.

I'm sorry if I'm sounding antagonistic, but we've been over this many
times. The patents, to me and to many people who ostensibly have
received better legal advice, are too broadly written to be worked
around.

~ C.

-- 
When the facts change, I change my mind. What do you do, sir? ~ Keynes

Corbin Simpson
<MostAwesomeDude-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

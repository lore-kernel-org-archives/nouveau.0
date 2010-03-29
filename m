From: SpliFF <spliff-nc9XehmSRdrhF+sknpXCvw@public.gmane.org>
Subject: Re: [radeonhd] Re: [Mesa3d-dev] Status of s3tc patent in
 respect to open-source drivers and workarounds
Date: Mon, 29 Mar 2010 12:39:55 +1100
Message-ID: <4BB004EB.5080109@warriorhut.org>
References: <4BAF41C0.5010201@warriorhut.org>
	<e7bd23c31003281707v4d8107a8ka4330ce69ba5b322@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <e7bd23c31003281707v4d8107a8ka4330ce69ba5b322-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On 03/29/10 11:07, Corbin Simpson wrote:On 03/29/10 11:07, Corbin
Simpson wrote:
> Since neither you nor Andrew are lawyers, I would kindly ask that you
> refrain from attempting to provide legal advice. :3
>   

If you know I'm not a lawyer (and my nick should be the first clue) then
it isn't an issue is it? As for Andrew you'll have to ask him that
yourself. Since it's also clear I'm not a mesa3d developer you assume no
legal responsibility for what I say either and you are under no
responsibility to listen.

Which is all irrelevant anyway because proposing to create a new
invention is not legal advice; it's an engineering suggestion. I
describe the patent claims and Andrews interpretation of patent law only
to emphasise things that a hypothetical new invention should *not* do.

> The scant legal advice that *has* been obtained suggests that the
> current course of action, wherein S3TC is not advertised without the
> aid of an external library or a configuration option force-enabling
> it, is the best course of action. I for one would prefer to have
> firsthand legal advice before making any changes, although I am not a
> lawyer and cannot provide legal advice.
>   

Solves nothing other than push the legal burden onto someone else
(distributions) who further push the burden to the end-user. All of
which makes it harder to use. As far as I can tell the official site of
the "external project" claims the project is unmaintained and at any
rate it's rather unpopular with certain distributions for reasons that
should be obvious.

I'm certainly not sugesting that knowingly infringing material be added
to mesa3d. What I'm suggesting is that some resources be made available
to write a new *non-infringing* decompressor and that it seems likely
the community may have overestimated the difficulty of the task. I often
wonder if the OSS community isn't becoming a victim of its own FUD. If
we need lawyers before writing code then we can't write ANY code and we
might as well all do something else.

I want to reiterate that it is my belief (as in non-legal opinion) that
the s3tc patent does not cover the s3tc format itself, or even specific
algorithms. What it covers appear to be specific methods that can be
used to encode it and some steps that can be used to decode it. The
issue is whether those claimed steps are the ONLY way of achieving an
acceptable result and I honestly don't think they are. You are free to
form your own opinion on that point. Then again if the community plays
ostrich and assumes the problem is now solved - and worse concludes that
any discussion of it is heresy - then how can a new invention be
developed (at least collaboratively)? Unfortunately I lack the indepth
knowledge of mesa3d internals and s3tc processing requirements required
to invent such a thing myself.

> At any rate, since Spring is open-source, I would heavily advise the
> Spring team to remember that OpenGL extensions that are not part of a
> core version are not guaranteed to be available, and in this case,
> there is a trivial workaround for when the extension is not present,
> so you guys could (and should!) include an uncompressed texture path
> and ship uncompressed textures.
>   

Unfortunately Spring is an engine, not a game. The issue is that people
writing games which use the engine typically use DDS textures due to
various community members bandying the format about like it's the second
coming. At any rate other than not supporting DDS at all (which would be
an extremely unpopular and unworkable decision) there isn't much I can
do to guarantee Spring games don't depend on proprietary drivers until a
non-infringing s3tc decoder exists.

SpliFF

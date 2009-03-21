From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau on sparc (Re: Mmiotrace work)
Date: Sat, 21 Mar 2009 22:04:07 +1000
Message-ID: <21d7e9970903210504o4ddec2f0l1e095360bdfd0b73@mail.gmail.com>
References: <6e757d380903192206p2fcbad6as20813b207f6d650f@mail.gmail.com>
	<20090320203850.4473bff4@daedalus.pq.iki.fi>
	<6a89f9d50903201246v2f1d65a9y93d6c056ef79c097@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6a89f9d50903201246v2f1d65a9y93d6c056ef79c097-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Cc: Jason Detring <detringj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Mar 21, 2009 at 5:46 AM, Stephane Marchesin
<marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org> wrote:
> On Fri, Mar 20, 2009 at 19:38, Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> wrote:
>> On Fri, 20 Mar 2009 00:06:39 -0500
>> Jason Detring <detringj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>>> Speaking of contributing, would you like a tester for Nouveau on
>>> SPARC64? =A0I have access to an Ultra 45 and a pair of PCI boards (TnT2,
>>> GeForce 6200, both with x86 VBIOSes unfortunately). =A0I don't own any
>>> PCI-E boards yet, but that can change if there's interest.
>>
>> I have no idea about non-x86/ppc support. Anyone?
>>
>
> It's never been tested before. There has to be a first !
>

You'll need at least a base kernel of drm-next, I'm not sure
the drm sparc fixes have been ported back to drm.git.

The first DRM radeon on sparc success was only about a month ago.

Dave.

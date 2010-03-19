From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Mesa3d-dev] makedepend in Mesa
Date: Fri, 19 Mar 2010 20:23:08 +0100
Message-ID: <b67489df1003191223v5b1d3152q5244f08d37b40e0f@mail.gmail.com>
References: <b67489df1002231329v1e4411a5ncaa61eb630670f5e@mail.gmail.com>
	<91705d081002231414q3a0bef51tcf260f9f4ec4c87f@mail.gmail.com>
	<b67489df1002251118w60d77d3dvadc284a0c59e0ee0@mail.gmail.com>
	<91705d081002251241g38a50792p4348d6b7593c5da4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <91705d081002251241g38a50792p4348d6b7593c5da4-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dan Nicholson <dbn.lists-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, mesa3d-dev <mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Feb 25, 2010 at 9:41 PM, Dan Nicholson <dbn.lists-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> diff --git a/configure.ac b/configure.ac
>> index 485836a..a582337 100644
>> --- a/configure.ac
>> +++ b/configure.ac
>> @@ -28,8 +28,11 @@ AC_PROG_CPP
>> =A0AC_PROG_CC
>> =A0AC_PROG_CXX
>> =A0AC_CHECK_PROGS([MAKE], [gmake make])
>> -AC_PATH_PROG([MKDEP], [makedepend])
>> =A0AC_PATH_PROG([SED], [sed])
>> +AC_PATH_PROG([MKDEP], [makedepend], no)
>> +if test "x$MKDEP" =3D xno; then
>> + =A0 =A0AC_MSG_ERROR([makedepend not found])
>> +fi
>
> Yep, that would do it. In fact, when I wrote configure.ac originally,
> I wanted it to be a hard requirement and assumed that AC_PATH_PROG
> would error by default if it didn't find the program.
>

Should I resubmit a proper git patch ?

I have been running with makedepend installed on my 3 systems for 1
month, it has worked very well. I don't think I got ONE weird failure
in the past month, while I used to get more than once per week.
The only thing I need is to sometimes run autogen.sh and/or configure,
when there are some structure changes (e.g. nv30-nv40 merge to nvfx).
AFAIK this is also handled automatically in other projects. But this
is much less annoying, because it fails at build time, instead of
segfaulting at runtime.

Everyone complains about mesa crappy build system so I thought all the
failures I got were expected. Now I see they weren't, just that
makedepend is badly required :)

I am just worried some people might run into the same troubles as me.
But I wonder if there are any since only Dan answered in that thread.

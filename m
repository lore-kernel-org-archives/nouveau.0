From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] exa: do PrepareAccess for classic too,
	since we do need to map the frontbuffer.
Date: Fri, 27 Feb 2009 12:31:55 +0100
Message-ID: <6d4bc9fc0902270331g254d6f9en8532e21ad49c9a20@mail.gmail.com>
References: <1235681723-11180-1-git-send-email-madman2003@gmail.com>
	<1235681723-11180-2-git-send-email-madman2003@gmail.com>
	<1235709737.3423.2.camel@localhost.localdomain>
	<49A7BB4F.7040103@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <49A7BB4F.7040103-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-1?Q?Herv=E9_Cauwelier?= <herve.cauwelier-GANU6spQydw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

You're confusing issues, yours is a performance issue, not a correctness is=
sue.

Maarten.

On Fri, Feb 27, 2009 at 11:07 AM, Herv=E9 Cauwelier
<herve.cauwelier-GANU6spQydw@public.gmane.org> wrote:
> Ben Skeggs a =E9crit :
>> On Thu, 2009-02-26 at 21:55 +0100, Maarten Maathuis wrote:
>>> - I'm surprised we didn't get serious complaints about not being able t=
o render to the frontbuffer.
>> We don't get serious complaints because it's not an issue. =A0EXA is giv=
en
>> the virtual address, and it remembers it. =A0The design of the mm
>> guarantees the virtual address of the buffer won't change, map()/unmap()
>> are there merely for synchronisation of CPU/GPU access.
>>
>> In the "classic" case, exaMarkSync()/exaWaitSync() do the
>> synchronisation job as we don't use prepare/finish_access().
>>
>> Ben.
>
> I didn't complain because I think you have more important issues to
> address, but I spend half of my work day on gnome-terminal and waiting a
> couple of seconds when switching windows or desktops is rapidly
> annoying. And no, I can't replace it because it's configured for my
> needs and I heavily use the tabs.
>
> If the bug could be addressed in gnome-terminal, I can work with them on
> Gnome's bugzilla, with any detail you could give to me.
>
> For now, I use a branch with Maarten's patches from February the 12th.
>
> Herv=E9
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

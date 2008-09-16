From: "Maarten Maathuis" <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: report almost a success with Randr1.2 on NV50
Date: Tue, 16 Sep 2008 10:37:32 +0200
Message-ID: <6d4bc9fc0809160137l31fbb9c5ya1255c050bef28b0@mail.gmail.com>
References: <48CE5F5C.8000302@free.fr>
	<6d4bc9fc0809150649w651de5d0q55a26356f34192e8@mail.gmail.com>
	<48CE6EB0.2010204@free.fr>
	<6d4bc9fc0809150730u1c3737d1kfbae26ce76e01cd4@mail.gmail.com>
	<48CF6B01.7000501@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <48CF6B01.7000501-GANU6spQydw@public.gmane.org>
Content-Disposition: inline
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

On Tue, Sep 16, 2008 at 10:14 AM, Herv=E9 Cauwelier
<herve.cauwelier-GANU6spQydw@public.gmane.org> wrote:
> Maarten Maathuis a =E9crit :
>> I can say now that you should remove these lines:
>>
>> HorizSync       28.0-64.0
>> VertRefresh     43.0-60.0
>>
>> Unless you are very sure you need them, otherwise they limit the modes
>> that are accepted.
>
> I've removed these lines and play again with xrandr this morning.
>
> A new xorg log: http://pastebin.ca/1204094
>
> I also took a picture of the desktop combining the 1280x1024 screen on
> the left and the 1280x800 one on the right:
> <http://img291.imageshack.us/my.php?image=3Drandr2screensdifferentrpw3.jp=
g>
>
> Herv=E9
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

I really can't see anything related to the vga being connected in the
log, so that makes it hard to know what is wrong.

Maarten.

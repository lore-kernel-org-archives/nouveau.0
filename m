From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: unable to play videos with nouveau
Date: Fri, 4 Dec 2009 21:33:50 +0100
Message-ID: <91752840912041233v26da7f1p11026a45335a8484@mail.gmail.com>
References: <200912041819.25426.schmirrwurst@googlemail.com>
	<91752840912041123q1611786x3a25373992f39238@mail.gmail.com>
	<200912042125.00410.schmirrwurst@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <200912042125.00410.schmirrwurst-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Dec 4, 2009 at 9:25 PM,  <schmirrwurst-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Le vendredi 4 d=E9cembre 2009 20:23:55, vous avez =E9crit :
>> On Fri, Dec 4, 2009 at 6:19 PM, =A0<schmirrwurst-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>> > on geforce 8, each time I use the nouveau driver, I'm unable to play
>> > videos, the video area remains black....
>>
>> Which xorg version ?
>>
>
> I'm using 1:7.4+3ubuntu10
>
>
>> See http://nouveau.freedesktop.org/wiki/FeatureMatrix
>> nv50 + xv -> note 7
>> 7 - Now it works fine, but you need Xserver 1.7 or newer. In other
>> case you need to run a composite manager (Compiz won't work, something
>> like xcompmgr or KWin with XRender).
>>
> I've just tried kwin with xrender, but still no video
>

Sorry, I meant to reply on the mailing list so that others can help.
Did you also try xcompmgr ?

Can you attach your Xorg.0.log and kernel/dmesg logs ?
Which player are you using, is it reporting any errors when running
from a terminal ?

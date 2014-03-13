From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
Subject: Re: nouveau_fan_update: possible circular locking
	dependency detected
Date: Thu, 13 Mar 2014 14:54:55 +0100
Message-ID: <5321B8AF.60001@labri.fr>
References: <20140309145157.GA504@joi.home>
	<CAKb7UviyaTRBqjcj6wZo=5_rZ+9V8WyMeE6O03nDk1QW-LEYEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UviyaTRBqjcj6wZo=5_rZ+9V8WyMeE6O03nDk1QW-LEYEg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Le 13/03/2014 14:38, Ilia Mirkin a =E9crit :
> On Sun, Mar 9, 2014 at 10:51 AM, Marcin Slusarz
> <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> [  326.168487] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [  326.168491] [ INFO: possible circular locking dependency detected ]
>> [  326.168496] 3.13.6 #1270 Not tainted
>> [  326.168500] -------------------------------------------------------
>> [  326.168504] ldconfig/22297 is trying to acquire lock:
>> [  326.168507]  (&(&priv->fan->lock)->rlock){-.-...}, at: [<ffffffffa00d=
5363>] nouveau_fan_update+0xeb/0x252 [nouveau]
>> [  326.168551]
>> but task is already holding lock:
>> [  326.168555]  (&(&priv->sensor.alarm_program_lock)->rlock){-.-...}, at=
: [<ffffffffa00d6a8a>] alarm_timer_callback+0xf1/0x179 [nouveau]
>> [  326.168587]
>> which lock already depends on the new lock.
>>
>> [  326.168592]
>> the existing dependency chain (in reverse order) is:
>> [  326.168596]
>> -> #1 (&(&priv->sensor.alarm_program_lock)->rlock){-.-...}:
>> [  326.168606]        [<ffffffff900a5656>] lock_acquire+0xce/0x117
>> [  326.168615]        [<ffffffff905a367e>] _raw_spin_lock_irqsave+0x3f/0=
x51
>> [  326.168623]        [<ffffffffa00d6a8a>] alarm_timer_callback+0xf1/0x1=
79 [nouveau]
>> [  326.168651]        [<ffffffffa00da895>] nv04_timer_alarm_trigger+0x1b=
1/0x1cb [nouveau]
>> [  326.168679]        [<ffffffffa00daaa0>] nv04_timer_alarm+0xb5/0xbe [n=
ouveau]
>> [  326.168708]        [<ffffffffa00d54ac>] nouveau_fan_update+0x234/0x25=
2 [nouveau]
>> [  326.168735]        [<ffffffffa00d54df>] nouveau_fan_alarm+0x15/0x17 [=
nouveau]
>> [  326.168763]        [<ffffffffa00da895>] nv04_timer_alarm_trigger+0x1b=
1/0x1cb [nouveau]
>> [  326.168790]        [<ffffffffa00da90a>] nv04_timer_intr+0x5b/0x13c [n=
ouveau]
>> [  326.168817]        [<ffffffffa00d0e9b>] nouveau_mc_intr+0x2e2/0x3b1 [=
nouveau]
>> [  326.168838]        [<ffffffff900ad359>] handle_irq_event_percpu+0x5c/=
0x1dc
>> [  326.168846]        [<ffffffff900ad515>] handle_irq_event+0x3c/0x5c
>> [  326.168852]        [<ffffffff900afa5e>] handle_edge_irq+0xc4/0xeb
>> [  326.168860]        [<ffffffff9003a828>] handle_irq+0x120/0x12d
>> [  326.168868]        [<ffffffff9003a2f8>] do_IRQ+0x48/0xaf
>> [  326.168873]        [<ffffffff905a41ef>] ret_from_intr+0x0/0x13
>> [  326.168881]        [<ffffffff90040ea2>] arch_cpu_idle+0x13/0x1d
>> [  326.168887]        [<ffffffff900acb2e>] cpu_startup_entry+0x140/0x218
>> [  326.168895]        [<ffffffff9005b0a0>] start_secondary+0x1bf/0x1c4
>> [  326.168902]
>> -> #0 (&(&priv->fan->lock)->rlock){-.-...}:
>> [  326.168913]        [<ffffffff900a49cc>] __lock_acquire+0x10be/0x182b
>> [  326.168920]        [<ffffffff900a5656>] lock_acquire+0xce/0x117
>> [  326.168924]        [<ffffffff905a367e>] _raw_spin_lock_irqsave+0x3f/0=
x51
>> [  326.168931]        [<ffffffffa00d5363>] nouveau_fan_update+0xeb/0x252=
 [nouveau]
>> [  326.168958]        [<ffffffffa00d5508>] nouveau_therm_fan_set+0x14/0x=
16 [nouveau]
>> [  326.168984]        [<ffffffffa00d4c6b>] nouveau_therm_update+0x303/0x=
312 [nouveau]
>> [  326.169011]        [<ffffffffa00d4c8d>] nouveau_therm_alarm+0x13/0x15=
 [nouveau]
>> [  326.169038]        [<ffffffffa00da895>] nv04_timer_alarm_trigger+0x1b=
1/0x1cb [nouveau]
>> [  326.169059]        [<ffffffffa00daaa0>] nv04_timer_alarm+0xb5/0xbe [n=
ouveau]
>> [  326.169079]        [<ffffffffa00d6af7>] alarm_timer_callback+0x15e/0x=
179 [nouveau]
>> [  326.169101]        [<ffffffffa00da895>] nv04_timer_alarm_trigger+0x1b=
1/0x1cb [nouveau]
>> [  326.169121]        [<ffffffffa00da90a>] nv04_timer_intr+0x5b/0x13c [n=
ouveau]
>> [  326.169142]        [<ffffffffa00d0e9b>] nouveau_mc_intr+0x2e2/0x3b1 [=
nouveau]
>> [  326.169160]        [<ffffffff900ad359>] handle_irq_event_percpu+0x5c/=
0x1dc
>> [  326.169165]        [<ffffffff900ad515>] handle_irq_event+0x3c/0x5c
>> [  326.169170]        [<ffffffff900afa5e>] handle_edge_irq+0xc4/0xeb
>> [  326.169175]        [<ffffffff9003a828>] handle_irq+0x120/0x12d
>> [  326.169179]        [<ffffffff9003a2f8>] do_IRQ+0x48/0xaf
>> [  326.169183]        [<ffffffff905a41ef>] ret_from_intr+0x0/0x13
>> [  326.169189]
>> other info that might help us debug this:
>>
>> [  326.169193]  Possible unsafe locking scenario:
>>
>> [  326.169195]        CPU0                    CPU1
>> [  326.169197]        ----                    ----
>> [  326.169199]   lock(&(&priv->sensor.alarm_program_lock)->rlock);
>> [  326.169205]                                lock(&(&priv->fan->lock)->=
rlock);
>> [  326.169211]                                lock(&(&priv->sensor.alarm=
_program_lock)->rlock);
>> [  326.169216]   lock(&(&priv->fan->lock)->rlock);
>> [  326.169221]
>>   *** DEADLOCK ***
>>
>>   [  326.169225] 1 lock held by ldconfig/22297:
>>   [  326.169229]  #0:  (&(&priv->sensor.alarm_program_lock)->rlock){-.-.=
..}, at: [<ffffffffa00d6a8a>] alarm_timer_callback+0xf1/0x179 [nouveau]
>>   [  326.169253]
>>   stack backtrace:
>>   [  326.169258] CPU: 7 PID: 22297 Comm: ldconfig Not tainted 3.13.6 #12=
70
>>   [  326.169260] Hardware name: System manufacturer System Product Name/=
P6T SE, BIOS 0603    09/02/2009
>>   [  326.169264]  ffffffff90fb6360 ffff8801bfdc3a38 ffffffff9059e369 000=
0000000000006
>>   [  326.169273]  ffffffff90fb61b0 ffff8801bfdc3a88 ffffffff905998cf 000=
0000000000002
>>   [  326.169282]  ffff8800b148dbe0 0000000000000001 ffff8800b148e1e0 000=
0000000000001
>>   [  326.169342] Call Trace:
>>   [  326.169344]  <IRQ>  [<ffffffff9059e369>] dump_stack+0x4e/0x71
>>   [  326.169352]  [<ffffffff905998cf>] print_circular_bug+0x2ad/0x2be
>>   [  326.169356]  [<ffffffff900a49cc>] __lock_acquire+0x10be/0x182b
>>   [  326.169360]  [<ffffffff900a3273>] ? check_irq_usage+0x99/0xab
>>   [  326.169365]  [<ffffffff900a5656>] lock_acquire+0xce/0x117
>>   [  326.169384]  [<ffffffffa00d5363>] ? nouveau_fan_update+0xeb/0x252 [=
nouveau]
>>   [  326.169388]  [<ffffffff905a367e>] _raw_spin_lock_irqsave+0x3f/0x51
>>   [  326.169407]  [<ffffffffa00d5363>] ? nouveau_fan_update+0xeb/0x252 [=
nouveau]
>>   [  326.169426]  [<ffffffffa00da871>] ? nv04_timer_alarm_trigger+0x18d/=
0x1cb [nouveau]
>>   [  326.169445]  [<ffffffffa00d5363>] nouveau_fan_update+0xeb/0x252 [no=
uveau]
>>   [  326.169465]  [<ffffffffa00d5508>] nouveau_therm_fan_set+0x14/0x16 [=
nouveau]
>>   [  326.169483]  [<ffffffffa00d4c6b>] nouveau_therm_update+0x303/0x312 =
[nouveau]
>>   [  326.169502]  [<ffffffffa00d4c8d>] nouveau_therm_alarm+0x13/0x15 [no=
uveau]
>>   [  326.169521]  [<ffffffffa00da895>] nv04_timer_alarm_trigger+0x1b1/0x=
1cb [nouveau]
>>   [  326.169541]  [<ffffffffa00daaa0>] nv04_timer_alarm+0xb5/0xbe [nouve=
au]
>>   [  326.169560]  [<ffffffffa00d6af7>] alarm_timer_callback+0x15e/0x179 =
[nouveau]
>>   [  326.169579]  [<ffffffffa00da895>] nv04_timer_alarm_trigger+0x1b1/0x=
1cb [nouveau]
>>   [  326.169598]  [<ffffffffa00da90a>] nv04_timer_intr+0x5b/0x13c [nouve=
au]
>>   [  326.169617]  [<ffffffffa00d0e9b>] nouveau_mc_intr+0x2e2/0x3b1 [nouv=
eau]
>>   [  326.169621]  [<ffffffff900ad359>] handle_irq_event_percpu+0x5c/0x1dc
>>   [  326.169624]  [<ffffffff900ad515>] handle_irq_event+0x3c/0x5c
>>   [  326.169628]  [<ffffffff900afa5e>] handle_edge_irq+0xc4/0xeb
>>   [  326.169631]  [<ffffffff9003a828>] handle_irq+0x120/0x12d
>>   [  326.169636]  [<ffffffff90073e8c>] ? irq_enter+0x13/0x64
>>   [  326.169640]  [<ffffffff9003a2f8>] do_IRQ+0x48/0xaf
>>   [  326.169644]  [<ffffffff905a41ef>] common_interrupt+0x6f/0x6f
>>   [  326.169646]  <EOI>  [<ffffffff905a428d>] ? retint_swapgs+0xe/0x13
>
> Marcin, how reproducible is this? What hardware was this on? If it's
> reasonably reproducible perhaps it makes sense to file a bug in the
> fd.o tracker?
>
> Martin, I think this is in code you've written (right?). Perhaps you
> can take a look? All that alarm/update/etc code that ends up
> immediately dispatching itself seems like a locking nightmare...
>
>    -ilia

Hey Ilia,

I'll have a look at it tonight. Yes, this is a little nightmarish :s

Martin

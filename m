From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] nvfx: restore BEGIN_RING usage
Date: Sun, 26 Dec 2010 13:17:00 +0100
Message-ID: <AANLkTiknDM4xjVzmQ-9J4RZ1ymeXXd_LLaMFn=uxeBsN@mail.gmail.com>
References: <1293291541-13587-1-git-send-email-chantry.xavier@gmail.com>
	<AANLkTinX8AoJcZgMiUFRAWZ4S0RaRibpSTPQwgyq8_=u@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTinX8AoJcZgMiUFRAWZ4S0RaRibpSTPQwgyq8_=u@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Michel Hermier <michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

There is indeed exactly the same problem with MARK_RING.
There is always one MARK_RING guarding each OUT_RELOC, but in several
cases there is only one MARK_RING for several OUT_RELOC, and some not
completely obvious and transparent size computation.

coccinelle does not help to check the sizes are correct, but here is
manual review :
nv30_fragtex nv40_fragtex nvfx_fragprog nvfx_fragtex : direct 1-1 mapping
nv04_2d nvfx_state_fb : not direct, but looks correct to me
nvfx_vbo : no idea, this one is awful :P

On Sun, Dec 26, 2010 at 12:02 PM, Michel Hermier
<michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> After cleaning my tree to match this change, I noticed a small
> potential issue which is not very likely to happens but still migth
> exist. The MARK_RING required to check OUT_RELOC calls are not
> updated. The issue is small since whe most probably will runout off
> pushbuffer space before runing out of relocs and the relocs is well
> protected introducing only graphical issues.
> Since you known how to use coccocinelle could you check that the
> BEGIN_RING followed by OUT_RELOC are guarded with a MARK_RING?
>
>
> 2010/12/25 Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> Michel Hermier reported libdrm segfault (and kernel crash) on nv40 using
>> gallium :
>> http://www.mail-archive.com/nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org/msg06563.html
>>
>> It turns out these were caused by some missing WAIT_RING (or wrong
>> computation of the WAIT_RING sizes). Unlike all other libdrm_nouveau use=
rs,
>> nvfx gallium tried to use a mininum calls of WAIT_RING, one WAIT_RING co=
uld
>> apply to many methods for different code paths and spread across several
>> functions. This made it too tricky to find out what the missing or wrong
>> WAIT_RING was.
>>
>> By restoring BEGIN_RING, we force one WAIT_RING per method, and it's much
>> easier to check if the free size required in the pushbuffer is correct. =
=A0As
>> curro said, "let's keep it simple for the maintainers until the big
>> bottlenecks are gone"
>>
>> Benchmarked on nv35 with openarena, nexuiz and ut2004 and no performance
>> regression.
>>
>> The core of this patch was made with Coccinelle, with minor manual fixes
>> made on top.
>

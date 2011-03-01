From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: CCACHE and VFETCH FAULTs causing lockups
Date: Tue, 1 Mar 2011 22:20:23 +0000
Message-ID: <AANLkTimiy=U04vfiXRAqDj_eT+zxSN2_3NvmF4jRQWxc@mail.gmail.com>
References: <AANLkTik0CkbQz=PoXNG7bQEn_5ssAfp7cr=Z=3qJz6h2@mail.gmail.com>
	<1299016269.1822.3.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1299016269.1822.3.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Mar 1, 2011 at 9:51 PM, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On Tue, 2011-03-01 at 21:08 +0000, Maarten Maathuis wrote:
>
>> Those come after 15-30 minutes of running warzone2100, i haven't
>> played any games for a while, so no idea how long this has been going
>> on.
>> I also got a TRAP_CCACHE on channel 2 a little while ago, it takes
>> much longer to trigger (a few hours). I'm using todays "nouveau
>> kernel" git.
> You're not the first person to have reported this fwiw, personally, I
> haven't seen it yet..
>
>>
>> I'm guessing something is being unmapped too early or without reason,
>> or some cache is stale. But it isn't obvious what exactly it is.
>>
>> Because i don't remember having these lockups before I'm inclined to
>> guess that this commit is involved
>> http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=3D6330d8f5ecc4a=
19fd2ad3c7fa128b2f4c2ce3360
>>
>> Any ideas?
> Not really. =A0If this commit *is* the cause, the problem is still
> somewhere else. =A0That commit just makes sure PTEs are marked invalid, so
> if it's causing your faults, then previously the GPU would still have
> been reading/writing invalid data.
>
> Plus, I expect you should probably have seen a VM fault..

So these faults are just generic errors? Unrelated to page faults?

>
> Ben.
>>
>> Maarten.
>>
>
>
>



-- =

Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.

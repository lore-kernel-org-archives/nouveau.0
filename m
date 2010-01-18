From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Gallium - remove DRI1 support
Date: Mon, 18 Jan 2010 14:58:52 -0500
Message-ID: <586c2acd1001181158t3b8495crd3d6d80771158911@mail.gmail.com>
References: <c2673ca61001180214q3d94bb87j5e38fa730139a562@mail.gmail.com>
	<586c2acd1001180743t178044d3ga73d0136a527c532@mail.gmail.com>
	<c2673ca61001181036k207b1371jc7d15a75406634@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <c2673ca61001181036k207b1371jc7d15a75406634-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: okias <d.okias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Jan 18, 2010 at 1:36 PM, okias <d.okias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I read on Nouveau Wiki page, "Nouveau drops UMS support, huge clean-up in DDX.
> Roughly 15k lines were deleted from the DDX when the user
> mode-setting, DRI1 support (DRI2 is still there), ..."
> so I just thought it's leftover.
>
> David
>
> 2010/1/18 Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> On Mon, Jan 18, 2010 at 5:14 AM, okias <d.okias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Compilation tested.
>>>
>>> --
>>
>> I still use DRI1 :) Any reason to remove it if it still works and
>> doesn't require much maintenance?
>>

I didn't realize DRI1 went away with UMS as well in the DDX. I have no
problem with it then, I'll just keep those paths around in my private
tree until I move to a newer xserver.

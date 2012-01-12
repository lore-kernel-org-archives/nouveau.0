From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: properly check for _DSM function support and Optimus
 support for vga_switcheroo
Date: Thu, 12 Jan 2012 17:29:28 +0000
Message-ID: <CAPM=9txFNPyDSL6FnPZdsrXtpK3T+gBNMjco2c2UaT3M=aOsPg@mail.gmail.com>
References: <CALBR5ZxR9iuvT57bDZ8yW9ZkZjuoUhBTYw4HBsmsiwoRi4gSkw@mail.gmail.com>
	<CALBR5ZyE2ZRX7eFBhooB22e9BRf0f3H2xqtvXB2iwe8nvKKnvw@mail.gmail.com>
	<CAOB9epp8EdpetsPStfdnGNx5-2dKi42j3DQiVKN_dzMdFcssWA@mail.gmail.com>
	<CALBR5Zw0gEDqKrSUF3R30tSSC6DUgfhVm0Y1Mp60e4bB4ObijQ@mail.gmail.com>
	<CAG2kNCwBwRJ_VrS9NHnmGvOTTLuwmBKd5kG8OknJG+f20Kvqsg@mail.gmail.com>
	<CALBR5ZzZpnZp4=65tFv=_ZJfz+eaxxMLk-T-5hWzHUhwSf+U=w@mail.gmail.com>
	<CALBR5Zxuwv-zBQfVr7By3su2rjWjcVapX7oCCfeybjBMPY9cbA@mail.gmail.com>
	<1326149109.31565.0.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1326149109.31565.0.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Jan 9, 2012 at 10:45 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, 2012-01-09 at 00:13 +0100, Lekensteyn wrote:
>> Any activity on this? The newly attached patch contains one difference
>> with the previous
>> one: a dummy function has been added to avoid an error if ACPI is
>> disabled.
> Dave,
>
> Any thoughts on this?

Yeah they both look fine, I'll test them on my machine tomorrow hopefully.

Dave.

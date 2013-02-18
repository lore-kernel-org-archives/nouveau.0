From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/7] nouveau: Check if the device supports
 modesetting, after opening it
Date: Mon, 18 Feb 2013 08:44:30 +0000
Message-ID: <5121E9EE.6060204@gmail.com>
References: <1361047727-740-1-git-send-email-emil.l.velikov@gmail.com>
	<1361047727-740-2-git-send-email-emil.l.velikov@gmail.com>
	<CAPM=9tyko+H6B2KRC7RaTKgkRan_rMy4FHz4=_95s=v4sgsaDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPM=9tyko+H6B2KRC7RaTKgkRan_rMy4FHz4=_95s=v4sgsaDQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 18/02/13 00:47, Dave Airlie wrote:
...

> Thats correct, the X server is not responsible for loading the kernel module.
> 
> If the kernel module isn't loaded then there is a bug elsewhere.
> 
> Dave.
> 

Same feeling in here as well. Although that does not stop people's
workflow habits [1]


Emil
[1] http://xkcd.com/1172/

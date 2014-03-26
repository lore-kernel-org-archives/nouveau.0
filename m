From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: nouveau.c
Date: Wed, 26 Mar 2014 16:58:08 -0400
Message-ID: <CAKb7UvjDfHaq+8EHGjQYuoRPZzLhV=Se8pXeHRJRJ7ZMY14aVA@mail.gmail.com>
References: <CANbfre5w0dTR_jPsKrV=0H-iDhumeVwNp_CE214uBLXetRCb3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CANbfre5w0dTR_jPsKrV=0H-iDhumeVwNp_CE214uBLXetRCb3g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Daniel Melo Jorge da Cunha <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

struct nouveau_device_priv *nvdev = calloc(1, sizeof(*nvdev));

calloc sets the entire structure to 0. so that field is implicitly set
to 0 on allocation.

On Wed, Mar 26, 2014 at 4:37 PM, Daniel Melo Jorge da Cunha
<dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi, I am inspecting the file nouveau.c...
> In the function nouveau_client_new there is the
> following:
>
> for (i = 0; i < nvdev->nr_client; i++) {
>
> but "nr_client" has no previous assignment
>
> so it has scrambled data. Is this expected behaviour
> or am I missing something (the most probable :)?
>
> And someone please tell me where do I find that ffs function.
>
> Thanks in advance!!
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

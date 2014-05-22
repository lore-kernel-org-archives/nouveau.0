From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: nouveau_object_new beginner question
Date: Thu, 22 May 2014 11:14:09 -0400
Message-ID: <CAKb7UviF0r3sSFupZ8=hLba4DXgexjfHCOb8+CztoDi3zm4DKQ@mail.gmail.com>
References: <CANbfre7VJESGRGj117npShqdk2kH6eoBecftwcX5WN-0uVP6UQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CANbfre7VJESGRGj117npShqdk2kH6eoBecftwcX5WN-0uVP6UQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Thu, May 22, 2014 at 10:37 AM, Daniel Melo Jorge da Cunha
<dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I'm sorry for this beginner question but I can't understand.
> File ../nouveau/nouveau.c, function nouveau_object_new.
> Assuming data has content. First, obj->data = obj + 1. This is perfect
> after the memcpy call.
> But when: *(struct nouveau_object **)obj->data = obj;
> I can't understand because now obj and obj->data has the same address,
> while previously obj->data pointed exactly to the contents of data.
> What am I missing?

You're a little off in your analysis. That line does

*obj->data = obj

not

obj->data = obj.

Basically it makes the assumption that the first field of the data is
a pointer, and then sets it to the newly-created obj structure. It's a
little fragile, but all the objects assigned to data do indeed start
with a nouveau_object pointer (nouveau_fifo and its derivatives,
nv04_notify).

Hope this helps,

  -ilia

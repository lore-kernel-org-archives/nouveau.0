From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: OpenArena artifacts since version bump to 1.1.1
Date: Sun, 18 May 2014 13:56:23 -0400
Message-ID: <CAKb7UvhzYGrH15ETyTQ0HKKWdsFAfVLr=tD4UODhK8mU39hxsQ@mail.gmail.com>
References: <CABikg9ydS+cU9Teu1tKJ1=Q1Kxs+ygKgjybsFCMHqmB3U2UFiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CABikg9ydS+cU9Teu1tKJ1=Q1Kxs+ygKgjybsFCMHqmB3U2UFiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Sergei Antonov <saproj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Ah, it's probably the compression that's breaking things... Do you
also see errors in dmesg about LTCG?

You can try turning it off by setting compressed = false in
nvc0_miptree.c:nvc0_miptree_create.

  -ilia

On Sun, May 18, 2014 at 1:51 PM, Sergei Antonov <saproj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello!
> I'm using NVIDIA GeForce GT 640M. And beginning with this commit:
>
>     commit 142c21b8d493318551932eee2e9d98ff14b473da
>     Author: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
>     Date:   Wed Mar 27 22:25:52 2013 +0100
>     drm/nouveau/drm: bump the driver version to 1.1.1 to report new features
>
> till the latest kernel 3.15-rc5 OpenArena game looks like this:
>   http://s3.postimg.org/wif3fbcvn/image.jpg
>   http://s27.postimg.org/md9olgr8z/image.jpg
>
> Is it a known bug? What can I do to fix it?
>
> Using Mesa version 10.0.3.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

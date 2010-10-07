From: =?ISO-8859-1?Q?Grzesiek_S=F3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Subject: Re: OT: compilation
Date: Thu, 07 Oct 2010 22:38:09 +0200
Message-ID: <4CAE2FB1.3000603@pfu.pl>
References: <4CAE2A1B.1000105@pfu.pl>
	<20101007233420.1f763477@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101007233420.1f763477-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 10/07/10 22:34, Pekka Paalanen wrote:
> On Thu, 07 Oct 2010 22:14:19 +0200
> Grzesiek S=F3jka<pld-t9zbU3WrWHI@public.gmane.org>  wrote:
>
>> I have two problems with the kernel compilation.
>>
>> 1. I have a small rootfs. It is too small to put all the modules
>> there without gzipping it first. So installing it requires lots
>> of sweating. That is why I was wondering if there is a (more/less
>> easy) way to make the "make modules_install" command gzip the
>> modules "on the fly".
>
> Wait, does modprobe support compressed kernel modules? I've
Yes, it does. I thing that most of the distribution pre-compiled kernels =

does have gziped modules.

> never heard of that. If you really do not want to touch
> the partitioning, how about symlinking some directories
> elsewhere? Be careful on what is needed to boot, though.
Wrong idea. I already tried this.

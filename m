From: "Rebecca N. Palmer" <r.palmer-mHdZ94l+r7K1Qrn1Bg8BZw@public.gmane.org>
Subject: About Using "nVidia Open Source Driver" on MIPS Computer
Date: Wed, 21 May 2014 10:04:22 +0100
Message-ID: <537C6C16.7030007@bham.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, gavin.liuzq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

Debian have been building nouveau on a wide range of CPUs, including 
mips (big-endian) and mipsel (little-endian, includes Loongson), for 
some time; however, this does not necessarily mean anyone has actually 
tried to use it.

https://packages.debian.org/sid/linux-image-3.14-1-4kc-malta
https://packages.debian.org/sid/libdrm-nouveau2
https://packages.debian.org/sid/xserver-xorg-video-nouveau
https://packages.debian.org/sid/libgl1-mesa-dri

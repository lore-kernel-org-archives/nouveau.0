From: =?UTF-8?Q?Marcin_Zaj=c4=85czkowski?= <mszpak-5tc4TXWwyLM@public.gmane.org>
Subject: Re: Tracking down severe regression in 5.3-rc4/5.4 for
 TU116 - assistance needed
Date: Fri, 20 Dec 2019 13:34:05 +0100
Message-ID: <301efb37-43f9-bbc8-b4a3-b41291d660c9@wp.pl>
References: <c34a6fe1-80dd-a4db-c605-0a13c69e803f@wp.pl>
 <CAKb7UviSYORoeDm1sbDFEzkGd68+DV=StCpzsiaGbA=1VQX3gw@mail.gmail.com>
 <233aafa2-1474-39bf-8ea0-fe1a3ecef167@wp.pl>
 <CAKb7UvgOVrwC91ys19uTAG2p_MRVqcsV_MAHOSL4-m3f+j=dNg@mail.gmail.com>
 <68def665-d236-f3e0-7033-bcb9b9436d1c@wp.pl>
 <CAKb7Uvion7KuwgNaz0G3UD15nnkfM8hfayQgDtgz4d8W6p98bg@mail.gmail.com>
 <20191220060507.GQ2913417@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20191220060507.GQ2913417-3PARRvDOhMZrdx17CPfAsdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Linux PCI <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 2019-12-20 07:05, Mika Westerberg wrote:
> On Thu, Dec 19, 2019 at 03:38:10PM -0500, Ilia Mirkin wrote:
>> Let's add Mika and Rafael, as they were responsible for that commit.
>> Mika/Rafael - any ideas? The commit in question is
>>
>> 0617bdede5114a0002298b12cd0ca2b0cfd0395d
> 
> This seems to be
> 
>   Revert "PCI: Add missing link delays required by the PCIe spec"
> 
> Can you try v5.5-rcX without any additional changes? It should include
> the same fix done bit differently (trying to avoid breaking systems
> which caused us to revert the previous one):
> 
>   4827d63891b6 PCI/PM: Add pcie_wait_for_link_delay()
>   ad9001f2f411 PCI/PM: Add missing link delays required by the PCIe spec

Thanks Mika, it looks very promising.
kernel-core-5.5.0-0.rc2.git0.1.fc32.x86_64 boots up without the
aforementioned errors and I can operate normally. I will play more with
5.5 before closing the issue, but at the moment it seems to be fixed.

Before I started digging which commits introduced regression I tested my
system with (then) latest stable kernel-5.4.2-300, but I see your
changes are only in the 5.5 line :).

Big thanks Ilia for your help to pinpoint the problematic commit.

Marcin

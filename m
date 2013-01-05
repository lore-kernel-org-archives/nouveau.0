From: Pontus Fuchs <pontus.fuchs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Resume regression with nouveau 3.8rc1 (bisected)
Date: Sat, 05 Jan 2013 10:10:06 +0100
Message-ID: <50E7EDEE.9090403@gmail.com>
References: <50E45007.5080706@gmail.com> <20130103125810.GA3198@joi.lan>
	<20130103191201.GA25680@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20130103191201.GA25680-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 01/03/2013 08:12 PM, Marcin Slusarz wrote:
> On Thu, Jan 03, 2013 at 01:58:10PM +0100, Marcin Slusarz wrote:
>> I bisected the problem down to this commit:
>>
>> 186ecad21: drm/nv50/disp: move remaining interrupt handling into core
>>
>> Hardware is 8400M GS (10de:0427) in a Dell XPS M1330.
>> There's already open bug report for that:
>> https://bugs.freedesktop.org/show_bug.cgi?id=58729
> Yay, a bug fix was just posted there ;).

Hi, I tried that patch but it didn't help :(

I see this in my kernel log after resume:

nouveau E[     PFB][0000:01:00.0] trapped read at 0x002001a020 on 
channel 0x00007b23 SEMAPHORE_BG/PFIFO_READ/00 reason: PAGE_NOT_PRESENT
nouveau E[    1177] failed to idle channel 0xcccc0000
[TTM] Failed to expire sync object before buffer eviction
[TTM] Failed to expire sync object before buffer eviction
[TTM] Failed to expire sync object before buffer eviction

//Pontus

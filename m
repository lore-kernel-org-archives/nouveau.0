From: Christoph Rudorff <chris@rudorff.com>
Subject: Re: [PATCH] drm/nouveau/fbcon: fix suspend/resume fbcon
Date: Tue, 19 Nov 2013 20:23:47 +0100
Message-ID: <528BBAC3.9060908@rudorff.com>
References: <1384880353.25836.12.camel@localhost> <20131119184847.GB11774@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20131119184847.GB11774@kroah.com>
Sender: stable-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org, bskeggs@redhat.com, emil.l.velikov@gmail.com
List-Id: nouveau.vger.kernel.org

On 19.11.2013 19:48, Greg KH wrote:
> On Tue, Nov 19, 2013 at 05:59:13PM +0100, Christoph Rudorff wrote:
>> Current code disables fbcon acceleration before fbcon is suspended,
>> leading to corrupted console after resume from s2disk. In a similar
>> fashion we must make sure that fbcon acceleration is enabled before we
>> revive the console.
>>
>> With this patch s2disk works correctly on my MacBookPro6,2 with GT216
>> [GeForce GT 330M]
>>
>> hibernate:
>> kernel: nouveau  [     DRM] suspending fbcon...
>> kernel: nouveau  [     DRM] suspending display...
>> kernel: nouveau  [     DRM] unpinning framebuffer(s)...
>> kernel: nouveau  [     DRM] evicting buffers...
>> kernel: nouveau  [     DRM] waiting for kernel channels to go idle...
>> kernel: nouveau  [     DRM] suspending client object trees...
>> kernel: nouveau  [     DRM] suspending kernel object tree...
>> resume:
>> kernel: nouveau  [     DRM] re-enabling device...
>> kernel: nouveau  [     DRM] resuming kernel object tree...
>> kernel: nouveau  [   VBIOS][0000:01:00.0] running init tables
>> kernel: nouveau  [     DRM] resuming client object trees...
>> kernel: nouveau  [     DRM] resuming display...
>> kernel: nouveau E[     PFB][0000:01:00.0] trapped write at 0x00007fe000 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT
>> kernel: nouveau E[     PFB][0000:01:00.0] trapped write at 0x00007fe000 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT
>> kernel: nouveau E[     PFB][0000:01:00.0] trapped write at 0x00007fe240 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT
>> kernel: nouveau E[     PFB][0000:01:00.0] trapped write at 0x00007fe400 on channel 0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT
>>
>> http://lists.freedesktop.org/archives/nouveau/2013-October/014656.html
>> ---
>>  drivers/gpu/drm/nouveau/nouveau_fbcon.c |    8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> <formletter>
> 
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
> for how to do this properly.
> 
> </formletter>

Sorry,

I've been asked to cc it.

chris

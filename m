From: Jerry Cooperstein <coop@linuxfoundation.org>
Subject: Re: drm/nouveau contiguous bo check produces lots of output
Date: Mon, 11 Nov 2013 10:05:11 -0600
Message-ID: <52810037.9010509@linuxfoundation.org>
References: <5280F855.1020900@linuxfoundation.org>
	<5280FE7C.3030704@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5280FE7C.3030704@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, bskeggs@redhat.com, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On 11/11/2013 09:57 AM, Maarten Lankhorst wrote:
> op 11-11-13 16:31, Jerry Cooperstein schreef:
>> Hi:
>>
>> commit bd9c5a2016307164c419c5e24a46921c10e620a0
>>
>> (drm/nouveau: require contiguous bo for framebuffer)
>> produces about 2000 lines of
>>
>> nouveau E[     DRM] framebuffer requires contiguous bo
>>
>> on system boot and more on shutdown, but I don't see other
>> negative effects.  I tried deploying a trivial patch removing the check and saw
>> no other problems.
>>
>> Is this a problem you have heard about?
>>
>> My hardware is an NVIDIA Geoforce G98 (8400 GS), lspci -v gives:
>>
>> 01:00.0 VGA compatible controller: NVIDIA Corporation G98 [GeForce 8400 GS] (rev a1) (prog-if 00 [VGA controller])
>>      Subsystem: ASUSTeK Computer Inc. Device 8278
>>      Flags: bus master, fast devsel, latency 0, IRQ 16
>>      Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
>>      Memory at d0000000 (64-bit, prefetchable) [size=256M]
>>      Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
>>      I/O ports at cc00 [size=128]
>>      Expansion ROM at fe9e0000 [disabled] [size=128K]
>>      Capabilities: [60] Power Management version 3
>>      Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
>>      Capabilities: [78] Express Endpoint, MSI 00
>>      Capabilities: [100] Virtual Channel
>>      Capabilities: [128] Power Budgeting <?>
>>      Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
>>      Kernel driver in use: nouveau
>>      Kernel modules: nouveau
>>
>> This appeared in the 3.12 rc kernels and is in 3.12.0
>>
>> If there is anything I can do to help you debug this please let me know.
>> I don't understand the drm code well enough to dive in deep on my own.
> It's a paranoia patch and any bo should not be created with NOUVEAU_GEM_TILE_NONCONTIG flag.
> Even if it happens to work it will fail on any sufficiently fragmented vram.
>
> What driver versions do you use?
>
> ~Maarten
>
>

I'm just using vanilla 3.12 kernel. Been using the nouveau driver
for a long time, no problems until this printout due to the
contiguous check.  Not using any of the "nvidia" related modules etc.
CONFIG_AGP is set.

lsmod | grep nouveau

nouveau               895494  2
ttm                    67720  1 nouveau
drm_kms_helper         38367  1 nouveau
drm                   258311  4 nouveau,ttm,drm_kms_helper
i2c_algo_bit            5122  1 nouveau
mxm_wmi                 1769  1 nouveau
wmi                     9036  2 nouveau,mxm_wmi

no other hardware other than built in intel hda sound, ahci disk,
and marvel GB NIC's.  Asus motherboard.

-- 
============================================================
  Jerry Cooperstein, PhD
  Training Program Director
  Linux Foundation
  coop@linuxfoundation.org
  (608) 848-1507 (Madison, WI, USA)
============================================================

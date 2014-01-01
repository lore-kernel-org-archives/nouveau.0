From: Sid Boyce <sboyce@blueyonder.co.uk>
Subject: Re: Possible 3.13-rc nouveau regression with GT 560 Ti
Date: Wed, 01 Jan 2014 00:41:48 +0000
Message-ID: <52C3644C.9090809@blueyonder.co.uk>
References: <52C29918.4060102@blueyonder.co.uk> <CAKb7UvhBunpMC6mzjRg7Zb5gGPPYj99=2jd+Lgnr-qeXFs0w9A@mail.gmail.com>
Reply-To: sboyce@blueyonder.co.uk
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <opensuse-factory+bounces-52631-glsod-opensuse-factory=m.gmane.org@opensuse.org>
List-Post: <mailto:opensuse-factory@opensuse.org>
List-Help: <mailto:opensuse-factory+help@opensuse.org>
List-Subscribe: <mailto:opensuse-factory+subscribe@opensuse.org>
List-Unsubscribe: <mailto:opensuse-factory+unsubscribe@opensuse.org>
List-Owner: <mailto:opensuse-factory+owner@opensuse.org>
List-Archive: <http://lists.opensuse.org/opensuse-factory/>
In-Reply-To: <CAKb7UvhBunpMC6mzjRg7Zb5gGPPYj99=2jd+Lgnr-qeXFs0w9A@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: LKML Mailing List <linux-kernel@vger.kernel.org>, opensuse factory list <opensuse-factory@opensuse.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On 31/12/13 10:36, Ilia Mirkin wrote:
> On Tue, Dec 31, 2013 at 5:14 AM, Sid Boyce <sboyce@blueyonder.co.uk> wrote:
>> System x86_64 with openSUSE 13.1.
>> X.Org version: 1.14.99.905
>>
>> openSUSE 12.2 kernels boot successfully into a graphical screen, login to
>> KDE4, etc. all normal.
>>
>> 3.13-rc kernels boot fully with X running but no graphical screen and it
>> freezes in VC with not all the startup messages displayed but I could ssh in
>> from another box to check dmesg and logs.
>>
>> Xorg.0.log which I thought I had saved did not log an error.
>>
>> dmesg said "nouveau Playlist update failed".
>>
>> Changed the GeForce GT 560 Ti for a GeForce 8600 GT and 3.13.0-rc6 is up and
>> running.
>>
>> If necessary I can go back to the GT 560 Ti to gather dmesg and Xorg log
>> information.
> Having a dmesg would be nice. One thing I can think of off-hand is
> that 3.13-rc has MSI turned on by default. You can turn it off by
> adding "nouveau.config=NvMSI=0" to your kernel cmdline. If that
> doesn't help, a bisect restricted to drivers/gpu/drm/nouveau should
> show the offending commit fairly quickly.
>
>    -ilia
>
Adding "nouveau.config=NvMSI=0" to the command line fixed the problem.
So it looks like commit 049ffa8ab33a63b3bff672d1a0ee6a35ad253fe8 
introduced it.
Thanks Ilia,
Regards
Sid.

-- 
Sid Boyce ... Hamradio License G3VBV, Licensed Private Pilot
Emeritus IBM/Amdahl Mainframes and Sun/Fujitsu Servers Tech Support
Senior Staff Specialist, Cricket Coach
Microsoft Windows Free Zone - Linux used for all Computing Tasks

-- 
To unsubscribe, e-mail: opensuse-factory+unsubscribe@opensuse.org
To contact the owner, e-mail: opensuse-factory+owner@opensuse.org

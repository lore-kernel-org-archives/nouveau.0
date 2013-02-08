From: Flavio Castelli <flavio-2uVk4PVEUg6lnMjI0IkVqw@public.gmane.org>
Subject: Re: Monitor with corrupted EDID
Date: Fri, 08 Feb 2013 09:23:56 +0100
Message-ID: <5114B61C.40308@castelli.me>
References: <CAAs+i9J0jFhD1==NYEGtwJDUPCH4oaxH7_9rdOsgU-R7iu=Gtg@mail.gmail.com>
	<51140285.4000108@verizon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <51140285.4000108-H+0wwilmMs3R7s880joybQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 02/07/2013 08:37 PM, mwesten wrote:
> I recently used a DOS program called ddcw.exe to fix the corrupted EDID
> on one of my monitors.

I already tried to write the good EDID into the monitor but I failed. I 
also tried to do that using i2cset with the same result. I suspect the 
EEPROM is write protected...

I'll give a shot to this program.

> If that doesn't work, the drm_kms_helper module in newer kernels should
> have a parameter to get around the problem.
>
> See https://www.osadl.org/Single-View.111+M50eaf2f2c66.0.html

That's working!

My monitor now is powered and I can use it.

There's only one minor issue: the nouveau module keeps complaining about 
the wrong EDID received by this monitor. Is there a way to tell the 
driver to stop probing the monitor?

Thanks a lot for the help

Flavio

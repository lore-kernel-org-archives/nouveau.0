From: Flavio Castelli <flavio-2uVk4PVEUg6lnMjI0IkVqw@public.gmane.org>
Subject: Re: Monitor with corrupted EDID
Date: Fri, 08 Feb 2013 14:11:45 +0100
Message-ID: <5114F991.3030703@castelli.me>
References: <CAAs+i9J0jFhD1==NYEGtwJDUPCH4oaxH7_9rdOsgU-R7iu=Gtg@mail.gmail.com>
	<51140285.4000108@verizon.net> <5114B61C.40308@castelli.me>
	<5114D712.4060600@verizon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5114D712.4060600-H+0wwilmMs3R7s880joybQ@public.gmane.org>
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

On 02/08/2013 11:44 AM, mwesten wrote:
> My suspicion is that if the EDID data got corrupted in the first place,
> then it's not protected.  I don't know about i2cset, or any other methods.

That's exactly what I'm thinking. I'm trying to overwrite the EEPROM 
using a DVI cable (since it's the DVI EDID which is broken). I saw other 
people used a vga -> dvi cable to do that because some pins could not be 
"exposed" by the DVI cable. I'm don't fully believe in this explanation.

Cheers
Flavio

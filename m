From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau Fermi Firmware
Date: Fri, 03 Jun 2011 14:47:40 +1000
Message-ID: <1307076464.2125.1.camel@nisroch>
References: <BANLkTikkN=sq8iop5yNJ1msXp1RXoxEZvA@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <BANLkTikkN=sq8iop5yNJ1msXp1RXoxEZvA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: christopher bradski <chris.bradski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 2011-06-01 at 22:59 -0700, christopher bradski wrote:
> I have a GTS 450 and love the way nouveau runs in 2d, I was looking to
> test 3D and have extracted most of the firmware from the Nvidia blob. 
If you grab the kernel from nouveau git, this should be unnecessary for
your chipset now.

>  Is f841a1c4 the correct register to retrieve the fuc41ad firmware
> file? When I try the following:
> 
> # insert correct register in next line
> grep f841a1c4 ../mydump.txt \
> | awk '{print $6}' | grep -oP '(?<=0x).*' | \
>         python -c \
> "
> import struct; import sys; fd = open(\"fuc41ad\", \"wb\");
> for line in sys.stdin:
>         fd.write(struct.pack(\"@I\", int(line.rstrip(), 16)))
> "
> It results in the fuc41ad file being written as a text file with the
> date Feb 12 2011 ? Is this correct? All three other firmware files are
> written as binary files... I know a bit of python and bash but am
> drawing a blank on this. 
Have you had a look at the trace itself and made sure there was more
than a couple of writes to 0x41a1c4?  The NVIDIA fuc blobs usually start
with a date string embedded in them, perhaps your trace was incomplete?

Ben.
> 
> Thank you all in advance for any help. Much appreciated. 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

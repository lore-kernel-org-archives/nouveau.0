From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau Ignoring invalid EDID block 1
Date: Wed, 15 Jun 2011 17:23:19 +0100
Message-ID: <op.vw4k45cd7cbmmg@emo>
References: <4DF88862.9030609@free.fr> <op.vw4dswkx7cbmmg@emo>
	<4DF8D09C.5070704@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4DF8D09C.5070704-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, zaverel <zaverel-GANU6spQydw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

As you have figured out already the issue is related to the
EDID parser in the common drm code.

I believe somewhere during the development process the parsing
became more strict, thus your issue.

Note the following differences

* "old kernel" - 2.6.36 (modeline via xorg.conf)

   1280x720 (0x79)   95.8MHz -HSync +VSync *current +preferred
         h: width  1280 start 1360 end 1488 total 1696 skew    0 clock   56.5KHz
         v: height  720 start  723 end  728 total  755           clock   74.8Hz

* "new kernel" - 2.6.39 (parsed by drm_edid)

   1280x720 (0x79)   74.2MHz +HSync +VSync *current +preferred
         h: width  1280 start 1720 end 1760 total 1980 skew    0 clock   37.5KHz
         v: height  720 start  725 end  730 total  750           clock   50.0Hz

* parse-edid

         Mode    "1280x720"      # vfreq 50.000Hz, hfreq 37.500kHz
                 DotClock        74.250000
                 HTimings        1280 1464 1504 1980
                 VTimings        720 725 730 750
                 Flags   "+HSync" "+VSync"
         EndMode



I would suggest for you to open a bugreport, attaching all the logs,
so that the developers working on the common drm code, can take a
look and provide better/safer solution (if available)

Thanks

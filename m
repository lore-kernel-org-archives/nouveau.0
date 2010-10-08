From: =?ISO-8859-2?Q?Grzesiek_S=F3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Subject: dual head X config
Date: Fri, 08 Oct 2010 18:01:04 +0200
Message-ID: <4CAF4040.5020409@pfu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Hi there,

I have a question. I have a dual DVI NV34 adapter and at the moment the 
Xserver works fine. Two separated displays configured as follows:

Section "Monitor"
   Identifier     "Monitor0"
   Option         "Primary"    "True"
EndSection
Section "Monitor"
   Identifier     "Monitor1"
   Option         "RightOf" "Monitor0"
   Option         "Primary"    "False"
EndSection
Section "Device"
   Identifier     "Device0"
   Driver         "nouveau"
   #assigns the output DVI-I-1 to Monitor0
   Option         "monitor-DVI-I-1" "Monitor0"
   #assigns the output DVI-I-2 to Monitor1
   Option         "monitor-DVI-I-2" "Monitor1"
EndSection
Section "Screen"
   Identifier          "screen0"
   Device              "Device0"
   Monitor             "Monitor0"
   DefaultDepth       16
   SubSection "Display"
     Depth           16
     Virtual          3200 1200
    EndSubSection
EndSection

The problem is that I would like to make the mplayer stretch the movie 
to both monitors when going into the fullscreen mode. When I was using 
the binary nvidia driver I used the TwinView to do this. Is it possible 
using the nouveau driver??

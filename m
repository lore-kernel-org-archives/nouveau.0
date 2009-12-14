From: Erik Auerswald <auerswal-4UQ70Bntwr2x0/aPbc6oMbNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] nouveau: avoid running out of relocs (attempt
	5)
Date: Mon, 14 Dec 2009 12:19:59 +0100
Message-ID: <20091214111959.GB4831@sushi.unix-ag.uni-kl.de>
References: <1260716857-6599-1-git-send-email-madman2003@gmail.com>
	<20091213210603.9d0926f3.mandin.patrice@orange.fr>
	<200912132033.39882.nightcast2000@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <200912132033.39882.nightcast2000-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Steven Ward <nightcast2000-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

On Sun, Dec 13, 2009 at 08:33:39PM +0000, Steven Ward wrote:
> Glxgears is working at long last ;),I'm getting around 60-100fps.

Glxgears is running with 155fps with software rendering on my 5 year old
box.

> I've tried Bzflag and Nexuiz,both will start up,but they are very slow when 
> they are running.

Software rendering would be reason for very slow Open GL apps.

What does glxinfo tell about your configuration? The relevant lines
would be (taken from my machine):

...
direct rendering: Yes
...
OpenGL vendor string: Mesa Project
OpenGL renderer string: Software Rasterizer
...

Br,
Erik
-- 
[W]e learned that the Linux load average rolls over at 1024. And we actually
found this out empirically.
                        -- H. Peter Anvin

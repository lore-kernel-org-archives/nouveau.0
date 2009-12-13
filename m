From: Steven Ward <nightcast2000-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] nouveau: avoid running out of relocs (attempt
	5)
Date: Sun, 13 Dec 2009 20:33:39 +0000
Message-ID: <200912132033.39882.nightcast2000@googlemail.com>
References: <1260716857-6599-1-git-send-email-madman2003@gmail.com>
	<20091213210603.9d0926f3.mandin.patrice@orange.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20091213210603.9d0926f3.mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Dear Maarten,
                        I have applied your latest patch into my Mesa git 
repository with the latest updates. I re-booted and the patches seemed fine to 
me(thought git apply was complaining a bit when I applied them).
Glxgears is working at long last ;),I'm getting around 60-100fps.

I've tried Bzflag and Nexuiz,both will start up,but they are very slow when 
they are running.The only personal app failed was Celestia.When I started that 
in Konsole,it came up with this error:celestia: swrast/s_span.c:1477: 
_swrast_write_rgba_span: Assertion `rb->_BaseFormat == 0x1908 || rb-
>_BaseFormat == 0x1907' failed.
Aborted

I would like to thank you very much for the patch.

Regards,
              Nightcast2000

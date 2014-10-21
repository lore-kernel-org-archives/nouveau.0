From: pierre.morrow-GANU6spQydw@public.gmane.org
Subject: Questions about some PFB registers on NVAC cards
Date: Wed, 22 Oct 2014 00:22:45 +0200 (CEST)
Message-ID: <1169721887.186887006.1413930165517.JavaMail.root@spooler8-g27.priv.proxad.net>
References: <2076098997.186540494.1413920348637.JavaMail.root@spooler8-g27.priv.proxad.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <2076098997.186540494.1413920348637.JavaMail.root-x5ewXQG5twBsFmKuirFwRhh1pbbyJDp15NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: open-gpu-doc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

When using acceleration with Nouveau on MacBook Pros with an 9400M (NVAC) card,
a PFIFO interrupt 0x00400000 is thrown during the initialisation of that card
(sometime after PFIFO and PGRAPH initialisation) and the laptop will lockup [1],
forcing users to load Nouveau without acceleration.

After some investigation, I found that enabling bit 1 of register 100c14 fixes
the issue on that card. Other NVAC cards are working great without that trick,
and it seems they have that bit enabled by default. What is the role of that
bit, and when should it be turned on?

Before enabling 100c14's bit 1, the Nvidia driver writes some value into 100c1c.
Leaving the default value, or writing some random value seemed to have no
effect. What is this register used for?

Thanks in advance for your help!

Best regards,

Pierre Moreau


[1]: https://bugs.freedesktop.org/show_bug.cgi?id=27501

From: Klaus Ebbe Grue <grue-okVzrDOvQGk@public.gmane.org>
Subject: Re: Could Fedora-5.9.9/X-server problem be a
 Nouveau-problem?
Date: Thu, 3 Dec 2020 16:03:08 +0000
Message-ID: <20e4ed0a13c34dd0b3dfa41924a40fc0@di.ku.dk>
References: <f827ab7dd91e4b1684dd818bd541272d@di.ku.dk>,
 <CAKb7UvjiRApxVzxT=9Y26uXWB3zDMf8Nvi+eHfE0yJUMAfGLog@mail.gmail.com>,
 <45fcac9dfcd54c20873427cc5042aeb4@di.ku.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <45fcac9dfcd54c20873427cc5042aeb4-okVzrDOvQGk@public.gmane.org>
Content-Language: da-DK
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Ilia,

Just to follow up:

I can work around the problem using this file:

> cat /etc/X11/xorg.conf.d/90-monitor.conf
Section "Monitor"
        Identifier "DP-1"
        Modeline "3840x2160" 533.25 3840 3888 3920 4000 2160 2163 2168 2222 +hsync -vsync
        Option "PreferredMode" "3840x2160"
EndSection

So it seems that everything works except detection of the monitor.

Cheers,
Klaus

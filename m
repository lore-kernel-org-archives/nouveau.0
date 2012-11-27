From: Tyler Durden <tylerdu-8Y23ZgqdBYRBDLzU/O5InQ@public.gmane.org>
Subject: Re: kms etc nouveau X failed
Date: Tue, 27 Nov 2012 16:39:37 +0100
Message-ID: <50B4DEB9.1050102@bounced.me>
References: <1354028922.6600.YahooMailNeo@web120404.mail.ne1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1354028922.6600.YahooMailNeo-l7sgct7Iq2sbWpotXP+qY5OW+3bF1jUfVpNB7YpNyf8@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Sebastian Glita <glseba-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 27.11.2012 16:08, Sebastian Glita wrote:
>      Option        "AutoEnableDevices"    "true"

I had some problems before when I let X (together with udev) 
autoconfigure devices. So I always have the above option set to false. 
And I suggest you try that first, too. It might help.

Generally, the problem is that your device (the GPU itself) goes undetected:

[ 63179.191] (EE) No devices detected.

-- 
Tyler

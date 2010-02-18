From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Mouse cursor rotated on all screens when rotating a
	single screen.
Date: Thu, 18 Feb 2010 21:10:23 +0100
Message-ID: <b67489df1002181210g231640fv7513f1fde82dc1b3@mail.gmail.com>
References: <20100218132710.127a3260@schinken.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100218132710.127a3260-5XCyKlKZwvAXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Hans Wurst <bon3fire-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, craig-26hVlxoXjdmZFXHMiJVqBHS5uNuOjpZe@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, Feb 18, 2010 at 1:27 PM, Hans Wurst <bon3fire-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> I have two monitors, one landscape and the other portrait. When I
>> rotate the portrait monitor using xrandr (or the xorg.conf option)
>> the mouse cursor on the landscape monitor is also rotated and the
>> "click point" is no longer below the cursor (this makes the mouse
>> practically unusable). The cursor is correct on the rotated monitor.
>> Setting NoAccel "False" and HWCursor "False" in xorg.conf results in
>> a corrupted screen and lockup.
>
>> I am running an up-to-date i686 Arch Linux with the latest git version
>> of xf86-video-nouveau (I used the AUR package). xorg-server is from
>> the arch core repositories. My card is the GeForce9500GT (two DVI
>> ports on the card).
>
> I've got the exact same problem. So: *BUMP*
>

See https://bugs.freedesktop.org/show_bug.cgi?id=26102

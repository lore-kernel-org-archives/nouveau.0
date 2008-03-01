From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14703] On NV17 on laptop screen: certain resolutions
 are scrambled
Date: Sat,  1 Mar 2008 10:43:19 -0800 (PST)
Message-ID: <20080301184319.C3D842DC01F@annarchy.freedesktop.org>
References: <bug-14703-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14703-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14703





--- Comment #10 from Phillip Ezolt <phillipezolt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-03-01 10:43:18 PST ---
>Did you ever use the blob and noticed what scaling options nvidia-settings
> offered?

I used the blob long, long ago. I THINK that it (unlike nv) used something like
aspect.  I remember liking the nv driver better because every mode was
fullscreen. 

> Could you make a picture of the SquiggleFont?

If I try to do a screen shot, it shows up just fine, so it seems like it is
definitely a display problem.  I'll take a picture with my digital camera. 

>Could you check the broken aspect ratio modes, and see if they have some kind
> of message like: "scaling resolution for widescreen/portrait something"

Yes.  "Scaling resolution on a widescreen panel" is present in both of the
broken modes (1152x864, 1024x768). I did notice something that I missed before.
One of the modes is clipped on the bottom. (And it says: Scaling resolution on
a portrait panel)

(BTW.  The panel is natively 1680x1050, but I left that resolution of all of
the tests.)

Here's my exhaustive test results:

                 Result              Scaling_String
   1360x768      Clipped on Bottom   "Scaling resolution on a portrait panel"   
   1280x800      Works               None
   1152x864      Corrupt             "Scaling resolution on a widescreen panel"
   1280x768      Works               None  
   1280x720      Clipped on Bottom   "Scaling resolution on a portrait panel"
   1024x768      Corrupt             "Scaling resolution on a widescreen panel" 
   800x600       Clipped on Right    "Scaling resolution on a widescreen panel"
                  (~100 pixels)
   640x480       Clipped on Right    "Scaling resolution on a widescreen panel"
                  (~100 pixels)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

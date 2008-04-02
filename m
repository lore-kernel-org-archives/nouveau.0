From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15252] X crashes on start with Geforce 7000M VGA
Date: Wed,  2 Apr 2008 13:07:11 -0700 (PDT)
Message-ID: <20080402200711.4858813013A@annarchy.freedesktop.org>
References: <bug-15252-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15252-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15252





--- Comment #5 from Nikolay Vladimirov <nikolay-CNN+Ke1O0i3Ube5+R26mEw@public.gmane.org>  2008-04-02 13:07:10 PST ---
Created an attachment (id=15630)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=15630)
fedora's randr patch

Not sure what to do. The rpm is built using the patch I attached and I also
enabled Randr 1.2 in xorg.conf and everything seems to work that way.  
The problem is when I comment HorizSync and VertRefresh according to
http://wiki.debian.org/XStrikeForce/HowToRandR12 -   X crashes and doesn't
start.
Also today's update of xserver in rawhide was broken and had to revert to
yesterdays version and these  things happen a lot in rawhide. So this maybe
some packaging or xserver issue.  
Maybe it's best if I report the bug to fedora? 


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

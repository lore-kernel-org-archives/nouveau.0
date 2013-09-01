From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63165] [NVE6] GTX660 GPU lockups on 3D applications
Date: Sun, 01 Sep 2013 06:17:08 +0000
Message-ID: <bug-63165-8800-myqcMKrz1p@http.bugs.freedesktop.org/>
References: <bug-63165-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1503380852=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63165-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1503380852==
Content-Type: multipart/alternative; boundary="1378016228.37ac2bC70.18826"; charset="us-ascii"


--1378016228.37ac2bC70.18826
Date: Sun, 1 Sep 2013 06:17:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63165

--- Comment #15 from miga-anyandall-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org ---
Created attachment 84990
  --> https://bugs.freedesktop.org/attachment.cgi?id=84990&action=edit
neverball+compiz

I installed 3.11-rc7 and while I'm still having issues with Compiz, everything
else seems to be working fine, which leads me to believe that Compiz is
probably what's at fault now.

Tried with Xonotic, Minetest, Neverball and am going to try to leave Red
Eclipse running for a while just to see if there are any crashes. If it doesn't
crash, I'll go ahead and mark this up to Compiz being at fault now.

I'll go ahead and upload the dmesg output of Compiz+Neverball crashing if you
want to view it and tell me if it's still a nouveau issue or if it is a Compiz
issue at this point.

Thanks for your help!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378016228.37ac2bC70.18826
Date: Sun, 1 Sep 2013 06:17:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] GTX660 GPU lockups on 3D applications"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63165#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] GTX660 GPU lockups on 3D applications"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63165">bug 63165</a>
              from <span class="vcard"><a class="email" href="mailto:miga-anyandall&#64;hotmail.com" title="miga-anyandall&#64;hotmail.com">miga-anyandall&#64;hotmail.com</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=84990" name="attach_84990" title="neverball+compiz">attachment 84990</a> <a href="attachment.cgi?id=84990&amp;action=edit" title="neverball+compiz">[details]</a></span>
neverball+compiz

I installed 3.11-rc7 and while I'm still having issues with Compiz, everything
else seems to be working fine, which leads me to believe that Compiz is
probably what's at fault now.

Tried with Xonotic, Minetest, Neverball and am going to try to leave Red
Eclipse running for a while just to see if there are any crashes. If it doesn't
crash, I'll go ahead and mark this up to Compiz being at fault now.

I'll go ahead and upload the dmesg output of Compiz+Neverball crashing if you
want to view it and tell me if it's still a nouveau issue or if it is a Compiz
issue at this point.

Thanks for your help!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378016228.37ac2bC70.18826--

--===============1503380852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1503380852==--

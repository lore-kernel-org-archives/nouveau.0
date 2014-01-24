From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74002] [NVE7] [un]plugging DP-3 on Lenovo W530
 results in interrupt storm
Date: Fri, 24 Jan 2014 20:42:00 +0000
Message-ID: <bug-74002-8800-G474cKmnYB@http.bugs.freedesktop.org/>
References: <bug-74002-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1353437128=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74002-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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


--===============1353437128==
Content-Type: multipart/alternative; boundary="1390596120.D8bFC62.9608"; charset="us-ascii"


--1390596120.D8bFC62.9608
Date: Fri, 24 Jan 2014 20:42:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74002

--- Comment #11 from Jamin Collins <jcollins-u0TlgVUp4POoiH3BShWgcg@public.gmane.org> ---
Created attachment 92739
  --> https://bugs.freedesktop.org/attachment.cgi?id=92739&action=edit
both sets of displays

I've confirmed I can replicate this problem with the displays at work as well. 
Attaching an Xorg log containing information for both sets of displays.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390596120.D8bFC62.9608
Date: Fri, 24 Jan 2014 20:42:00 +0000
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
   title="NEW --- - [NVE7] [un]plugging DP-3 on Lenovo W530 results in interrupt storm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74002#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] [un]plugging DP-3 on Lenovo W530 results in interrupt storm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74002">bug 74002</a>
              from <span class="vcard"><a class="email" href="mailto:jcollins&#64;asgardsrealm.net" title="Jamin Collins &lt;jcollins&#64;asgardsrealm.net&gt;"> <span class="fn">Jamin Collins</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=92739" name="attach_92739" title="both sets of displays">attachment 92739</a> <a href="attachment.cgi?id=92739&amp;action=edit" title="both sets of displays">[details]</a></span>
both sets of displays

I've confirmed I can replicate this problem with the displays at work as well. 
Attaching an Xorg log containing information for both sets of displays.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390596120.D8bFC62.9608--

--===============1353437128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1353437128==--

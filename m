From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72180] [NVE6] Random GPU Lockups
Date: Sun, 01 Dec 2013 21:11:41 +0000
Message-ID: <bug-72180-8800-2O2Z9P5sGG@http.bugs.freedesktop.org/>
References: <bug-72180-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0611307103=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72180-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0611307103==
Content-Type: multipart/alternative; boundary="1385932302.685FCceB3.11523"; charset="us-ascii"


--1385932302.685FCceB3.11523
Date: Sun, 1 Dec 2013 21:11:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72180

--- Comment #14 from Jordan Bass <bass.jordan+bugzilla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 90061
  --> https://bugs.freedesktop.org/attachment.cgi?id=90061&action=edit
dmesg nouveau log

Okay I took another one, this time doing some more stuff I thought could have a
chance of triggering it. This one came out as expected. The downside is loading
it causes nouveau to fail. Attached the log from dmesg with the relevant
nouveau bits.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385932302.685FCceB3.11523
Date: Sun, 1 Dec 2013 21:11:42 +0000
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
   title="NEW --- - [NVE6] Random GPU Lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] Random GPU Lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180">bug 72180</a>
              from <span class="vcard"><a class="email" href="mailto:bass.jordan+bugzilla&#64;gmail.com" title="Jordan Bass &lt;bass.jordan+bugzilla&#64;gmail.com&gt;"> <span class="fn">Jordan Bass</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=90061" name="attach_90061" title="dmesg nouveau log">attachment 90061</a> <a href="attachment.cgi?id=90061&amp;action=edit" title="dmesg nouveau log">[details]</a></span>
dmesg nouveau log

Okay I took another one, this time doing some more stuff I thought could have a
chance of triggering it. This one came out as expected. The downside is loading
it causes nouveau to fail. Attached the log from dmesg with the relevant
nouveau bits.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385932302.685FCceB3.11523--

--===============0611307103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0611307103==--

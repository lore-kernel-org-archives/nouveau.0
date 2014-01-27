From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74123] [NVE7] windows maximize behind xfce4-panel
 until settings viewed
Date: Mon, 27 Jan 2014 18:51:58 +0000
Message-ID: <bug-74123-8800-SgpbPob7gL@http.bugs.freedesktop.org/>
References: <bug-74123-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0118847393=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74123-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0118847393==
Content-Type: multipart/alternative; boundary="1390848718.fFF0FBC11.12667"; charset="us-ascii"


--1390848718.fFF0FBC11.12667
Date: Mon, 27 Jan 2014 18:51:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74123

--- Comment #2 from Jamin Collins <jcollins-u0TlgVUp4POoiH3BShWgcg@public.gmane.org> ---
Created attachment 92875
  --> https://bugs.freedesktop.org/attachment.cgi?id=92875&action=edit
correct behavior with intel driver

By switching the display graphics from discrete to integrated and thus the
video driver from nouveau to intel, the problem goes away.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390848718.fFF0FBC11.12667
Date: Mon, 27 Jan 2014 18:51:58 +0000
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
   title="NEW --- - [NVE7] windows maximize behind xfce4-panel until settings viewed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74123#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] windows maximize behind xfce4-panel until settings viewed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74123">bug 74123</a>
              from <span class="vcard"><a class="email" href="mailto:jcollins&#64;asgardsrealm.net" title="Jamin Collins &lt;jcollins&#64;asgardsrealm.net&gt;"> <span class="fn">Jamin Collins</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=92875" name="attach_92875" title="correct behavior with intel driver">attachment 92875</a> <a href="attachment.cgi?id=92875&amp;action=edit" title="correct behavior with intel driver">[details]</a></span>
correct behavior with intel driver

By switching the display graphics from discrete to integrated and thus the
video driver from nouveau to intel, the problem goes away.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390848718.fFF0FBC11.12667--

--===============0118847393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0118847393==--

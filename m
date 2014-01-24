From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74002] [NVE7] [un]docking Lenovo W530 results in
 interrupt storm
Date: Fri, 24 Jan 2014 06:25:07 +0000
Message-ID: <bug-74002-8800-nh4Ddjaj5X@http.bugs.freedesktop.org/>
References: <bug-74002-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1643631116=="
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


--===============1643631116==
Content-Type: multipart/alternative; boundary="1390544708.d31fB2.13814"; charset="us-ascii"


--1390544708.d31fB2.13814
Date: Fri, 24 Jan 2014 06:25:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74002

--- Comment #10 from Jamin Collins <jcollins-u0TlgVUp4POoiH3BShWgcg@public.gmane.org> ---
Created attachment 92716
  --> https://bugs.freedesktop.org/attachment.cgi?id=92716&action=edit
Xorg log for normal connections

To further complicate matters, it appears to matter which monitor it is that is
connected to DP-3.  If I change the order of the monitors and and place the
monitor that is normally connected to DP-2 on DP-3 and the one that is normally
connected to DP-3 on DP-2, this problem goes away at least here at home.

Monitor that is normally connected to DP-2:
Manufacturer: DEL  Model: a05c  Serial#: 843992405

Monitor that is normally connected to DP-3:
Manufacturer: GWY  Model: 777  Serial#: 16843009

However, at work the unit is normally connected to three 24" monitors which
require the use of DP-3 and trigger this issue as well.  So, simply changing
the connection order will only work around the issue at one location.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390544708.d31fB2.13814
Date: Fri, 24 Jan 2014 06:25:08 +0000
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
   title="NEW --- - [NVE7] [un]docking Lenovo W530 results in interrupt storm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74002#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] [un]docking Lenovo W530 results in interrupt storm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74002">bug 74002</a>
              from <span class="vcard"><a class="email" href="mailto:jcollins&#64;asgardsrealm.net" title="Jamin Collins &lt;jcollins&#64;asgardsrealm.net&gt;"> <span class="fn">Jamin Collins</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=92716" name="attach_92716" title="Xorg log for normal connections">attachment 92716</a> <a href="attachment.cgi?id=92716&amp;action=edit" title="Xorg log for normal connections">[details]</a></span>
Xorg log for normal connections

To further complicate matters, it appears to matter which monitor it is that is
connected to DP-3.  If I change the order of the monitors and and place the
monitor that is normally connected to DP-2 on DP-3 and the one that is normally
connected to DP-3 on DP-2, this problem goes away at least here at home.

Monitor that is normally connected to DP-2:
Manufacturer: DEL  Model: a05c  Serial#: 843992405

Monitor that is normally connected to DP-3:
Manufacturer: GWY  Model: 777  Serial#: 16843009

However, at work the unit is normally connected to three 24&quot; monitors which
require the use of DP-3 and trigger this issue as well.  So, simply changing
the connection order will only work around the issue at one location.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390544708.d31fB2.13814--

--===============1643631116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1643631116==--

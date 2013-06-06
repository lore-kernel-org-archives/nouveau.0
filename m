From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63135] [bisected] G69/nv50 DisplayPort dual-head
 fails to switch to KMS
Date: Thu, 06 Jun 2013 22:07:46 +0000
Message-ID: <bug-63135-8800-SrHq6vk0vE@http.bugs.freedesktop.org/>
References: <bug-63135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0222542610=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63135-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0222542610==
Content-Type: multipart/alternative; boundary="1370556466.007B371.3048"; charset="us-ascii"


--1370556466.007B371.3048
Date: Thu, 6 Jun 2013 22:07:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63135

--- Comment #16 from Devin J. Pohly <djpohly+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 80441
  --> https://bugs.freedesktop.org/attachment.cgi?id=80441&action=edit
log from first bad rev, hanged boot

Have some logs.  God bless the serial console.

Attached one full log from the last good commit, and two logs from the first
bad commit: one where the system boots normally, and one where it hangs.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1370556466.007B371.3048
Date: Thu, 6 Jun 2013 22:07:46 +0000
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
   title="NEW --- - [bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135">bug 63135</a>
              from <span class="vcard"><a class="email" href="mailto:djpohly+freedesktop&#64;gmail.com" title="Devin J. Pohly &lt;djpohly+freedesktop&#64;gmail.com&gt;"> <span class="fn">Devin J. Pohly</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=80441" name="attach_80441" title="log from first bad rev, hanged boot">attachment 80441</a> <a href="attachment.cgi?id=80441&amp;action=edit" title="log from first bad rev, hanged boot">[details]</a></span>
log from first bad rev, hanged boot

Have some logs.  God bless the serial console.

Attached one full log from the last good commit, and two logs from the first
bad commit: one where the system boots normally, and one where it hangs.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1370556466.007B371.3048--

--===============0222542610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0222542610==--

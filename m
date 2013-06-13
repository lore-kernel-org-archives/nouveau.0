From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63135] [bisected] G69/nv50 DisplayPort dual-head
 fails to switch to KMS
Date: Thu, 13 Jun 2013 20:49:26 +0000
Message-ID: <bug-63135-8800-HjAQWQsQmI@http.bugs.freedesktop.org/>
References: <bug-63135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0988391545=="
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


--===============0988391545==
Content-Type: multipart/alternative; boundary="1371156566.380A21.17305"; charset="us-ascii"


--1371156566.380A21.17305
Date: Thu, 13 Jun 2013 20:49:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63135

--- Comment #21 from Devin J. Pohly <djpohly+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 80796
  --> https://bugs.freedesktop.org/attachment.cgi?id=80796&action=edit
log from recent git with patch, no hang, no video

Well, I haven't gotten a recent kernel to hang.  So that's good in a way. 
Unfortunately the displays still don't work.

Attached a log from the serial console, on a recent git kernel with the "Parse
DP table v20" patch applied.  If I will need to re-bisect, let me know what I
should look for as a determining factor for good/bad.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1371156566.380A21.17305
Date: Thu, 13 Jun 2013 20:49:26 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135">bug 63135</a>
              from <span class="vcard"><a class="email" href="mailto:djpohly+freedesktop&#64;gmail.com" title="Devin J. Pohly &lt;djpohly+freedesktop&#64;gmail.com&gt;"> <span class="fn">Devin J. Pohly</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=80796" name="attach_80796" title="log from recent git with patch, no hang, no video">attachment 80796</a> <a href="attachment.cgi?id=80796&amp;action=edit" title="log from recent git with patch, no hang, no video">[details]</a></span>
log from recent git with patch, no hang, no video

Well, I haven't gotten a recent kernel to hang.  So that's good in a way. 
Unfortunately the displays still don't work.

Attached a log from the serial console, on a recent git kernel with the &quot;Parse
DP table v20&quot; patch applied.  If I will need to re-bisect, let me know what I
should look for as a determining factor for good/bad.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1371156566.380A21.17305--

--===============0988391545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0988391545==--

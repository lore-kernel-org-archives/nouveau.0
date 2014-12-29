From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87830] New: I got bright noise screen (static) like
 on TV after boot.
Date: Mon, 29 Dec 2014 14:16:17 +0000
Message-ID: <bug-87830-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2045626633=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2045626633==
Content-Type: multipart/alternative; boundary="1419862577.Cebb1.13720"; charset="UTF-8"


--1419862577.Cebb1.13720
Date: Mon, 29 Dec 2014 14:16:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87830

            Bug ID: 87830
           Summary: I got bright noise screen (static) like on TV after
                    boot.
           Product: xorg
           Version: unspecified
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: shordak-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 111470
  --> https://bugs.freedesktop.org/attachment.cgi?id=111470&action=edit
log_buf_len=1M && dmesg > kernel_log_xxx.txt

I can switch to all tty* and somehow except tty7 (where I get that noise
screen) In tty1 it looks like resolution is about 1280x1024 (native res. for my
LCD).
On tty7 I have gnome. Can't do anything there. Screen doesn't change at all.
I have NVidia GTX550Ti.

 Linux thepc 3.13.0-43-lowlatency #72+7.0trisquel2 SMP PREEMPT Mon Dec 15
03:41:11 UTC 2014 i686 athlon i686 GNU/Linux

ps -ax under root returned:
171 ?        S      0:00 [irq/43-nouveau]
1702 tty1     S+     0:00 grep --color=auto nouveau

dmesg: http://pastebin.pw/arzeht

dmesg is also attached

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419862577.Cebb1.13720
Date: Mon, 29 Dec 2014 14:16:17 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - I got bright noise screen (static) like on TV after boot."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87830">87830</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>I got bright noise screen (static) like on TV after boot.
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>shordak&#64;yandex.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=111470" name="attach_111470" title="log_buf_len=1M &amp;&amp; dmesg &gt; kernel_log_xxx.txt">attachment 111470</a> <a href="attachment.cgi?id=111470&amp;action=edit" title="log_buf_len=1M &amp;&amp; dmesg &gt; kernel_log_xxx.txt">[details]</a></span>
log_buf_len=1M &amp;&amp; dmesg &gt; kernel_log_xxx.txt

I can switch to all tty* and somehow except tty7 (where I get that noise
screen) In tty1 it looks like resolution is about 1280x1024 (native res. for my
LCD).
On tty7 I have gnome. Can't do anything there. Screen doesn't change at all.
I have NVidia GTX550Ti.

 Linux thepc 3.13.0-43-lowlatency #72+7.0trisquel2 SMP PREEMPT Mon Dec 15
03:41:11 UTC 2014 i686 athlon i686 GNU/Linux

ps -ax under root returned:
171 ?        S      0:00 [irq/43-nouveau]
1702 tty1     S+     0:00 grep --color=auto nouveau

dmesg: <a href="http://pastebin.pw/arzeht">http://pastebin.pw/arzeht</a>

dmesg is also attached</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419862577.Cebb1.13720--

--===============2045626633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2045626633==--

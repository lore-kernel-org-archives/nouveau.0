From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92962] KDE hangs and system freezes while journalctl
 lists complains of kernel (nouveau). Nvidia graphics
Date: Mon, 16 Nov 2015 09:39:36 +0000
Message-ID: <bug-92962-8800-WF3Pca8cBA@http.bugs.freedesktop.org/>
References: <bug-92962-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1293334797=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92962-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1293334797==
Content-Type: multipart/alternative; boundary="1447666776.d122E1.300"; charset="UTF-8"


--1447666776.d122E1.300
Date: Mon, 16 Nov 2015 09:39:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92962

stakanov-KuiJ5kEpwI6ELgA04lAiVw@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
           Assignee|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |stakanov-KuiJ5kEpwI6ELgA04lAiVw@public.gmane.org
                   |rg                          |

--- Comment #5 from stakanov-KuiJ5kEpwI6ELgA04lAiVw@public.gmane.org ---
Created attachment 119699
  --> https://bugs.freedesktop.org/attachment.cgi?id=119699&action=edit
journalctl with -k-b-1

Some more info. 
For what is the output of cat:
I do yet not understand when to blacklist nouveau.
should I just blacklist it, then start it by hand with modprobe nouveau?
Once the system freezed I cannot input anything anymore. 
So I guess I have to blacklist before and start manually? Then provoke the
freeze?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447666776.d122E1.300
Date: Mon, 16 Nov 2015 09:39:36 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:stakanov&#64;freenet.de" title="stakanov&#64;freenet.de">stakanov&#64;freenet.de</a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - KDE hangs and system freezes while journalctl lists complains of kernel (nouveau). Nvidia graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92962">bug 92962</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>NEEDINFO
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Assignee</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>stakanov&#64;freenet.de
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - KDE hangs and system freezes while journalctl lists complains of kernel (nouveau). Nvidia graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92962#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - KDE hangs and system freezes while journalctl lists complains of kernel (nouveau). Nvidia graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92962">bug 92962</a>
              from <span class="vcard"><a class="email" href="mailto:stakanov&#64;freenet.de" title="stakanov&#64;freenet.de">stakanov&#64;freenet.de</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=119699" name="attach_119699" title="journalctl with -k-b-1">attachment 119699</a> <a href="attachment.cgi?id=119699&amp;action=edit" title="journalctl with -k-b-1">[details]</a></span>
journalctl with -k-b-1

Some more info. 
For what is the output of cat:
I do yet not understand when to blacklist nouveau.
should I just blacklist it, then start it by hand with modprobe nouveau?
Once the system freezed I cannot input anything anymore. 
So I guess I have to blacklist before and start manually? Then provoke the
freeze?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447666776.d122E1.300--

--===============1293334797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1293334797==--

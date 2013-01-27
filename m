From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57350] [nouveau,
 linux-3.7-rc] Broken cursor and kernel log swamped with trapped
 reads/writes from BAR/PFIFO_READ/FB
Date: Sun, 27 Jan 2013 01:58:21 +0000
Message-ID: <bug-57350-8800-uF79gDvBr3@http.bugs.freedesktop.org/>
References: <bug-57350-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2091028535=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57350-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2091028535==
Content-Type: multipart/alternative; boundary="1359251901.5F25cd4b5.19380"; charset="us-ascii"


--1359251901.5F25cd4b5.19380
Date: Sun, 27 Jan 2013 01:58:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57350

Mourad De Clerck <bugs-freedesktop-mfMr2rENS1xBDgjK7y7TUQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugs-freedesktop-mfMr2rENS1yIwRZHo2/mJg@public.gmane.org
                   |                            |m

--- Comment #8 from Mourad De Clerck <bugs-freedesktop-mfMr2rENS1xBDgjK7y7TUQ@public.gmane.org> ---
This also affects my MacbookPro7,1 with an MCP89 (NVAF)

The same symptoms: the middle of the cursor is transparent, and if I proceed to
login directly (Gnome 3), it locks up eventually.

One difference is the reason: VRAM_LIMIT instead of PAGE_NOT_PRESENT. The
channel and address range seem to match the original submitter's dmesg.

The workaround to suspend and resume also seems to work for me too on 3.7.

It started happening from 3.7 onwards. I tried 3.8-rc4, and the bug's still
there (however resume doesn't work on 3.8-rc4, probably something else wrong).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1359251901.5F25cd4b5.19380
Date: Sun, 27 Jan 2013 01:58:21 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:bugs-freedesktop&#64;aquazul.com" title="Mourad De Clerck &lt;bugs-freedesktop&#64;aquazul.com&gt;"> <span class="fn">Mourad De Clerck</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350">bug 57350</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>bugs-freedesktop&#64;aquazul.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350">bug 57350</a>
              from <span class="vcard"><a class="email" href="mailto:bugs-freedesktop&#64;aquazul.com" title="Mourad De Clerck &lt;bugs-freedesktop&#64;aquazul.com&gt;"> <span class="fn">Mourad De Clerck</span></a>
</span></b>
        <pre>This also affects my MacbookPro7,1 with an MCP89 (NVAF)

The same symptoms: the middle of the cursor is transparent, and if I proceed to
login directly (Gnome 3), it locks up eventually.

One difference is the reason: VRAM_LIMIT instead of PAGE_NOT_PRESENT. The
channel and address range seem to match the original submitter's dmesg.

The workaround to suspend and resume also seems to work for me too on 3.7.

It started happening from 3.7 onwards. I tried 3.8-rc4, and the bug's still
there (however resume doesn't work on 3.8-rc4, probably something else wrong).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1359251901.5F25cd4b5.19380--

--===============2091028535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2091028535==--

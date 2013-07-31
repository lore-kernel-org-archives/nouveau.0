From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67382] [nouveau,
 nv50] linux 3.9.7-3.10.3: Xorg won't be available
Date: Wed, 31 Jul 2013 15:45:45 +0000
Message-ID: <bug-67382-8800-wwSKLYuVG8@http.bugs.freedesktop.org/>
References: <bug-67382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0327521440=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0327521440==
Content-Type: multipart/alternative; boundary="1375285545.bfe1Bd1.3762"; charset="us-ascii"


--1375285545.bfe1Bd1.3762
Date: Wed, 31 Jul 2013 15:45:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67382

--- Comment #18 from Anonymous Helper <anonymous-IjDkMZObD1hBDgjK7y7TUQ@public.gmane.org> ---
Created attachment 83378
  --> https://bugs.freedesktop.org/attachment.cgi?id=83378&action=edit
BIOS dump from my graphic card

The card type is Nvidia Geforce 8800 GTS manufactured from Leadtek (IIRC
Leadtek WinFast PX8800GTS TDH 320MB PCI-E)
And the card has two dvi connectors (dual-linked, whatever that means) and a
tv-out.
Both are working, but only one is used.

dvi-1 --> dvi-to-vga adaptor going to a vga monitor
dvi-2 --> normally not used. But working
tv-out --> never tested

After the problems appeared and this second screen "appeared" I switched the
connector, but with the same result.
If I changed the connector while the system was running, I got a picture from
this "ghost"
What did it look like..

On dvi-1, once I get to a tty, it's resolution is like 1680x1050, but only
1024x768 is used.
Switched to dvi-2 it's the same picture but the resolution is changed to
1024x768

Something else you need to know?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375285545.bfe1Bd1.3762
Date: Wed, 31 Jul 2013 15:45:45 +0000
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
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382">bug 67382</a>
              from <span class="vcard"><a class="email" href="mailto:anonymous&#64;dodgeit.com" title="Anonymous Helper &lt;anonymous&#64;dodgeit.com&gt;"> <span class="fn">Anonymous Helper</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=83378" name="attach_83378" title="BIOS dump from my graphic card">attachment 83378</a> <a href="attachment.cgi?id=83378&amp;action=edit" title="BIOS dump from my graphic card">[details]</a></span>
BIOS dump from my graphic card

The card type is Nvidia Geforce 8800 GTS manufactured from Leadtek (IIRC
Leadtek WinFast PX8800GTS TDH 320MB PCI-E)
And the card has two dvi connectors (dual-linked, whatever that means) and a
tv-out.
Both are working, but only one is used.

dvi-1 --&gt; dvi-to-vga adaptor going to a vga monitor
dvi-2 --&gt; normally not used. But working
tv-out --&gt; never tested

After the problems appeared and this second screen &quot;appeared&quot; I switched the
connector, but with the same result.
If I changed the connector while the system was running, I got a picture from
this &quot;ghost&quot;
What did it look like..

On dvi-1, once I get to a tty, it's resolution is like 1680x1050, but only
1024x768 is used.
Switched to dvi-2 it's the same picture but the resolution is changed to
1024x768

Something else you need to know?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375285545.bfe1Bd1.3762--

--===============0327521440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0327521440==--

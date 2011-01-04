From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32453] SIGABRT caused by malloc around RegionCreate.
 Can only reproduce with nouveau not vesa.
Date: Tue,  4 Jan 2011 01:53:10 -0800 (PST)
Message-ID: <20110104095310.2595913004E@annarchy.freedesktop.org>
References: <bug-32453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-32453-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

aHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MzI0NTMKCk1pY2hl
bCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+IGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQg
ICAgfFJlbW92ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogIEF0dGFjaG1lbnQgIzQxMTg3fHRleHQveC1sb2cgICAgICAgICAgICAgICAgICB8dGV4dC9w
bGFpbgogICAgICAgICAgbWltZSB0eXBlfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8Cgot
LSAKQ29uZmlndXJlIGJ1Z21haWw6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvdXNlcnBy
ZWZzLmNnaT90YWI9ZW1haWwKLS0tLS0tLSBZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVj
YXVzZTogLS0tLS0tLQpZb3UgYXJlIHRoZSBhc3NpZ25lZSBmb3IgdGhlIGJ1Zy4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxp
c3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

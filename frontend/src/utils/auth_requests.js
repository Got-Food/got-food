function authHeaders(token) {
  return { Authorization: `Bearer ${token}` };
}

export async function apiLogin(email, password) {
  const form = new FormData();
  form.append("email", email);
  form.append("password", password);
  const res = await fetch("/api/auth/login", { method: "POST", body: form });
  return { ok: res.ok, status: res.status, data: await res.json() };
}

export async function apiLogout(token) {
  const res = await fetch("/api/auth/logout", {
    method: "POST",
    headers: authHeaders(token),
  });
  return { ok: res.ok };
}

export async function apiGetMe(token) {
  const res = await fetch("/api/auth/users/me", {
    headers: authHeaders(token),
  });
  return { ok: res.ok, data: await res.json() };
}
